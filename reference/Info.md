# Info

Info

Info

## Details

Info contains versioning information. how we'll want to distribute that
information.

## Methods

### Public methods

- [`Info$new()`](#method-Info-new)

- [`Info$to_list()`](#method-Info-to_list)

- [`Info$clone()`](#method-Info-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    Info$new(
      build_date = NULL,
      compiler = NULL,
      git_commit = NULL,
      git_tree_state = NULL,
      git_version = NULL,
      go_version = NULL,
      major = NULL,
      minor = NULL,
      platform = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    Info$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Info$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
