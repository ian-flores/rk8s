# V1CertificateSigningRequestStatus

V1CertificateSigningRequestStatus

V1CertificateSigningRequestStatus

## Details

CertificateSigningRequestStatus contains conditions used to indicate
approved/denied/failed status of the request, and the issued
certificate.

## Methods

### Public methods

- [`V1CertificateSigningRequestStatus$new()`](#method-V1CertificateSigningRequestStatus-new)

- [`V1CertificateSigningRequestStatus$to_list()`](#method-V1CertificateSigningRequestStatus-to_list)

- [`V1CertificateSigningRequestStatus$clone()`](#method-V1CertificateSigningRequestStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CertificateSigningRequestStatus$new(certificate = NULL, conditions = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CertificateSigningRequestStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CertificateSigningRequestStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
