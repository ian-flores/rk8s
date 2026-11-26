# V1ControllerRevision

V1ControllerRevision

V1ControllerRevision

## Details

ControllerRevision implements an immutable snapshot of state data.
Clients are responsible for serializing and deserializing the objects
that contain their internal state. Once a ControllerRevision has been
successfully created, it can not be updated. The API Server will fail
validation of all requests that attempt to mutate the Data field.
ControllerRevisions may, however, be deleted. Note that, due to its use
by both the DaemonSet and StatefulSet controllers for update and
rollback, this object is beta. However, it may be subject to name and
representation changes in future releases, and clients should not depend
on its stability. It is primarily for internal use by controllers.

## Methods

### Public methods

- [`V1ControllerRevision$new()`](#method-V1ControllerRevision-new)

- [`V1ControllerRevision$to_list()`](#method-V1ControllerRevision-to_list)

- [`V1ControllerRevision$clone()`](#method-V1ControllerRevision-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ControllerRevision$new(
      api_version = NULL,
      data = NULL,
      kind = NULL,
      metadata = NULL,
      revision = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ControllerRevision$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ControllerRevision$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
