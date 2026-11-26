# V1CertificateSigningRequestCondition

V1CertificateSigningRequestCondition

V1CertificateSigningRequestCondition

## Details

CertificateSigningRequestCondition describes a condition of a
CertificateSigningRequest object

## Methods

### Public methods

- [`V1CertificateSigningRequestCondition$new()`](#method-V1CertificateSigningRequestCondition-new)

- [`V1CertificateSigningRequestCondition$to_list()`](#method-V1CertificateSigningRequestCondition-to_list)

- [`V1CertificateSigningRequestCondition$clone()`](#method-V1CertificateSigningRequestCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CertificateSigningRequestCondition$new(
      last_transition_time = NULL,
      last_update_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CertificateSigningRequestCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CertificateSigningRequestCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
