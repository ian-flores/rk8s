# V1HostAlias

V1HostAlias

V1HostAlias

## Details

HostAlias holds the mapping between IP and hostnames that will be
injected as an entry in the pod's hosts file.

## Methods

### Public methods

- [`V1HostAlias$new()`](#method-V1HostAlias-new)

- [`V1HostAlias$to_list()`](#method-V1HostAlias-to_list)

- [`V1HostAlias$clone()`](#method-V1HostAlias-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HostAlias$new(hostnames = NULL, ip = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HostAlias$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HostAlias$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
