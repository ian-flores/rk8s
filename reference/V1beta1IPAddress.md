# V1beta1IPAddress

V1beta1IPAddress

V1beta1IPAddress

## Details

IPAddress represents a single IP of a single IP Family. The object is
designed to be used by APIs that operate on IP addresses. The object is
used by the Service core API for allocation of IP addresses. An IP
address can be represented in different formats, to guarantee the
uniqueness of the IP, the name of the object is the IP address in
canonical format, four decimal digits separated by dots suppressing
leading zeros for IPv4 and the representation defined by RFC 5952 for
IPv6. Valid: 192.168.1.5 or 2001:db8::1 or
2001:db8:aaaa:bbbb:cccc:dddd:eeee:1 Invalid: 10.01.2.3 or
2001:db8:0:0:0::1

## Methods

### Public methods

- [`V1beta1IPAddress$new()`](#method-V1beta1IPAddress-new)

- [`V1beta1IPAddress$to_list()`](#method-V1beta1IPAddress-to_list)

- [`V1beta1IPAddress$clone()`](#method-V1beta1IPAddress-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1IPAddress$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1IPAddress$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1IPAddress$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
