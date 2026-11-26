# V1LifecycleHandler

V1LifecycleHandler

V1LifecycleHandler

## Details

LifecycleHandler defines a specific action that should be taken in a
lifecycle hook. One and only one of the fields, except TCPSocket must be
specified.

## Methods

### Public methods

- [`V1LifecycleHandler$new()`](#method-V1LifecycleHandler-new)

- [`V1LifecycleHandler$to_list()`](#method-V1LifecycleHandler-to_list)

- [`V1LifecycleHandler$clone()`](#method-V1LifecycleHandler-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LifecycleHandler$new(
      exec = NULL,
      http_get = NULL,
      sleep = NULL,
      tcp_socket = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LifecycleHandler$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LifecycleHandler$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
