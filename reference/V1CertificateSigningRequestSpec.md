# V1CertificateSigningRequestSpec

V1CertificateSigningRequestSpec

V1CertificateSigningRequestSpec

## Details

CertificateSigningRequestSpec contains the certificate request.

## Methods

### Public methods

- [`V1CertificateSigningRequestSpec$new()`](#method-V1CertificateSigningRequestSpec-new)

- [`V1CertificateSigningRequestSpec$to_list()`](#method-V1CertificateSigningRequestSpec-to_list)

- [`V1CertificateSigningRequestSpec$clone()`](#method-V1CertificateSigningRequestSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CertificateSigningRequestSpec$new(
      expiration_seconds = NULL,
      extra = NULL,
      groups = NULL,
      request = NULL,
      signer_name = NULL,
      uid = NULL,
      usages = NULL,
      username = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CertificateSigningRequestSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CertificateSigningRequestSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
