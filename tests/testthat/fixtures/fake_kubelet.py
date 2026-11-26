# Minimal wss:// stand-in for the API server's exec / portforward endpoints
# (v4.channel.k8s.io). Used by test-ws-transport.R.
#
# usage: python3 fake_kubelet.py CERT KEY PORTFILE LOGFILE
#
# Every request that completes the TLS handshake is logged as
#   REQUEST <path> auth=<Authorization> proto=<Sec-WebSocket-Protocol>
# so tests can assert that nothing reached an untrusted server.
import json, os, socket, ssl, struct, sys, threading, base64, hashlib
from urllib.parse import urlsplit, parse_qs

CERT, KEY, PORTFILE, LOGFILE = sys.argv[1:5]
TOKEN = "Bearer good-token"
V4 = "v4.channel.k8s.io"
V5 = "v5.channel.k8s.io"
# FAKE_PROTOCOLS: what this server supports, in preference order.
SUPPORTED = os.environ.get("FAKE_PROTOCOLS", V5 + "," + V4).split(",")
lock = threading.Lock()

def log(line):
    with lock, open(LOGFILE, "a") as f:
        f.write(line + "\n")

class Conn:
    def __init__(self, sock):
        self.sock, self.buf = sock, b""
    def read(self, n):
        while len(self.buf) < n:
            d = self.sock.recv(65536)
            if not d:
                raise EOFError
            self.buf += d
        out, self.buf = self.buf[:n], self.buf[n:]
        return out
    def read_headers(self):
        while b"\r\n\r\n" not in self.buf:
            d = self.sock.recv(65536)
            if not d:
                raise EOFError
            self.buf += d
        head, self.buf = self.buf.split(b"\r\n\r\n", 1)
        lines = head.decode().split("\r\n")
        hdrs = {}
        for l in lines[1:]:
            k, _, v = l.partition(":")
            hdrs[k.strip().lower()] = v.strip()
        return lines[0].split(" ")[1], hdrs
    def send_frame(self, payload, opcode=2):
        n = len(payload)
        if n < 126:
            h = struct.pack("!BB", 0x80 | opcode, n)
        elif n < 65536:
            h = struct.pack("!BBH", 0x80 | opcode, 126, n)
        else:
            h = struct.pack("!BBQ", 0x80 | opcode, 127, n)
        self.sock.sendall(h + payload)
    def recv_frame(self):
        b1, b2 = self.read(2)
        opcode, n = b1 & 0x0F, b2 & 0x7F
        if n == 126:
            n = struct.unpack("!H", self.read(2))[0]
        elif n == 127:
            n = struct.unpack("!Q", self.read(8))[0]
        mask = self.read(4) if b2 & 0x80 else b"\0\0\0\0"
        data = bytes(c ^ mask[i % 4] for i, c in enumerate(self.read(n)))
        return opcode, data
    def close(self):
        mode = os.environ.get("FAKE_CLOSE_MODE", "abrupt")
        try:
            if mode != "tcp":
                self.send_frame(struct.pack("!H", 1000), opcode=8)
            if mode == "graceful":
                self.sock.settimeout(2)
                while self.recv_frame()[0] != 8:
                    pass
        except Exception:
            pass
        self.sock.close()

def exec_session(c, q, proto):
    cmd = q.get("command", [])
    c.send_frame(b"\x01" + ("ran: %s\n" % " ".join(cmd)).encode())
    c.send_frame(b"\x02" + b"a warning\n")
    if q.get("stdin", ["false"])[0] == "true":
        # Like the API server: only v5 can close stdin (channel 255 with the
        # stream id); v4 has no EOF signal, and unknown channels are ignored.
        while True:
            op, data = c.recv_frame()
            if op == 8:
                break
            if op != 2 or not data:
                continue
            if data[:1] == b"\xff":
                if proto == V5 and data[1:2] == b"\x00":
                    break
                continue
            if data[:1] == b"\x00" and len(data) > 1:
                c.send_frame(b"\x01" + data[1:])
    if cmd[:1] == ["false"]:
        st = {"kind": "Status", "status": "Failure", "reason": "NonZeroExitCode",
              "details": {"causes": [{"reason": "ExitCode", "message": "1"}]}}
    else:
        st = {"kind": "Status", "status": "Success"}
    c.send_frame(b"\x03" + json.dumps(st).encode())
    c.close()

def portforward_session(c, q):
    port = int(q["ports"][0])
    le = struct.pack("<H", port)
    c.send_frame(b"\x00" + le)
    c.send_frame(b"\x01" + le)
    while True:
        op, data = c.recv_frame()
        if op == 8:
            break
        if op == 2 and data[:1] == b"\x00":
            c.send_frame(b"\x00" + data[1:].upper())
    c.close()

def handle(raw):
    try:
        sock = ctx.wrap_socket(raw, server_side=True)
    except Exception as e:
        log("TLS-FAIL %s" % type(e).__name__)
        return
    c = Conn(sock)
    try:
        path, h = c.read_headers()
        log("REQUEST %s auth=%s proto=%s" % (urlsplit(path).path,
            h.get("authorization", "-"), h.get("sec-websocket-protocol", "-")))
        if h.get("authorization") != TOKEN:
            sock.sendall(b"HTTP/1.1 401 Unauthorized\r\nContent-Length: 0\r\n\r\n")
            return sock.close()
        offered = [p.strip() for p in h.get("sec-websocket-protocol", "").split(",")]
        chosen = next((p for p in SUPPORTED if p in offered), None)
        if chosen is None:
            sock.sendall(b"HTTP/1.1 400 Bad Request\r\nContent-Length: 0\r\n\r\n")
            return sock.close()
        acc = base64.b64encode(hashlib.sha1((h["sec-websocket-key"] +
              "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").encode()).digest()).decode()
        sock.sendall(("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\n"
                      "Connection: Upgrade\r\nSec-WebSocket-Accept: %s\r\n"
                      "Sec-WebSocket-Protocol: %s\r\n\r\n" % (acc, chosen)).encode())
        u = urlsplit(path)
        q = parse_qs(u.query)
        if u.path.endswith("/exec"):
            exec_session(c, q, chosen)
        elif u.path.endswith("/portforward"):
            portforward_session(c, q)
        else:
            c.close()
    except (EOFError, ConnectionError, ssl.SSLError):
        pass

ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.load_cert_chain(CERT, KEY)
srv = socket.socket()
srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
srv.bind(("127.0.0.1", 0))
srv.listen(16)
with open(PORTFILE + ".tmp", "w") as f:
    f.write(str(srv.getsockname()[1]))
os.replace(PORTFILE + ".tmp", PORTFILE)
while True:
    s, _ = srv.accept()
    threading.Thread(target=handle, args=(s,), daemon=True).start()
