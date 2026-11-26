# Run a command in a pod, capture stdout/stderr/exit code

Higher-level one-shot wrapper over
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md)
for the common case: "run this and tell me what happened". Blocks until
the remote command exits and the connection closes.

## Usage

``` r
pod_exec(
  client,
  namespace,
  name,
  command,
  container = NULL,
  stdin_data = NULL,
  timeout = 60
)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md)
  (typically `kube()$client`).

- namespace:

  Namespace of the pod.

- name:

  Pod name.

- command:

  Character vector: the command and its arguments.

- container:

  Optional container name (required if the pod has more than one
  container).

- stdin_data:

  Optional character or raw vector to send on stdin before closing the
  input channel.

- timeout:

  Wall-clock cap in seconds (default 60). Sessions that exceed it are
  forcibly closed; `timed_out = TRUE` is set on the result.

## Value

A list with `stdout` (character), `stderr` (character), `exit_code`
(integer or `NA`), and `timed_out` (logical).

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "-la", "/"))
cat(r$stdout); message("exit ", r$exit_code)
} # }
```
