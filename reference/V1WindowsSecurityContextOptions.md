# V1WindowsSecurityContextOptions

V1WindowsSecurityContextOptions

V1WindowsSecurityContextOptions

## Details

WindowsSecurityContextOptions contain Windows-specific options and
credentials.

## Methods

### Public methods

- [`V1WindowsSecurityContextOptions$new()`](#method-V1WindowsSecurityContextOptions-new)

- [`V1WindowsSecurityContextOptions$to_list()`](#method-V1WindowsSecurityContextOptions-to_list)

- [`V1WindowsSecurityContextOptions$clone()`](#method-V1WindowsSecurityContextOptions-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1WindowsSecurityContextOptions$new(
      gmsa_credential_spec = NULL,
      gmsa_credential_spec_name = NULL,
      host_process = NULL,
      run_as_user_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1WindowsSecurityContextOptions$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1WindowsSecurityContextOptions$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
