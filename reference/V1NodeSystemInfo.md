# V1NodeSystemInfo

V1NodeSystemInfo

V1NodeSystemInfo

## Details

NodeSystemInfo is a set of ids/uuids to uniquely identify the node.

## Methods

### Public methods

- [`V1NodeSystemInfo$new()`](#method-V1NodeSystemInfo-new)

- [`V1NodeSystemInfo$to_list()`](#method-V1NodeSystemInfo-to_list)

- [`V1NodeSystemInfo$clone()`](#method-V1NodeSystemInfo-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeSystemInfo$new(
      architecture = NULL,
      boot_id = NULL,
      container_runtime_version = NULL,
      kernel_version = NULL,
      kube_proxy_version = NULL,
      kubelet_version = NULL,
      machine_id = NULL,
      operating_system = NULL,
      os_image = NULL,
      system_uuid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeSystemInfo$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeSystemInfo$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
