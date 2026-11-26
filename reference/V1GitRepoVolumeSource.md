# V1GitRepoVolumeSource

V1GitRepoVolumeSource

V1GitRepoVolumeSource

## Details

Represents a volume that is populated with the contents of a git
repository. Git repo volumes do not support ownership management. Git
repo volumes support SELinux relabeling.

DEPRECATED: GitRepo is deprecated. To provision a container with a git
repo, mount an EmptyDir into an InitContainer that clones the repo using
git, then mount the EmptyDir into the Pod's container.

## Methods

### Public methods

- [`V1GitRepoVolumeSource$new()`](#method-V1GitRepoVolumeSource-new)

- [`V1GitRepoVolumeSource$to_list()`](#method-V1GitRepoVolumeSource-to_list)

- [`V1GitRepoVolumeSource$clone()`](#method-V1GitRepoVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1GitRepoVolumeSource$new(directory = NULL, repository = NULL, revision = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1GitRepoVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1GitRepoVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
