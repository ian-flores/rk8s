# V1CertificateSigningRequest

V1CertificateSigningRequest

V1CertificateSigningRequest

## Details

CertificateSigningRequest objects provide a mechanism to obtain x509
certificates by submitting a certificate signing request, and having it
asynchronously approved and issued.

Kubelets use this API to obtain: 1. client certificates to authenticate
to kube-apiserver (with the
"kubernetes.io/kube-apiserver-client-kubelet" signerName). 2. serving
certificates for TLS endpoints kube-apiserver can connect to securely
(with the "kubernetes.io/kubelet-serving" signerName).

This API can be used to request client certificates to authenticate to
kube-apiserver (with the "kubernetes.io/kube-apiserver-client"
signerName), or to obtain certificates from custom non-Kubernetes
signers.

## Methods

### Public methods

- [`V1CertificateSigningRequest$new()`](#method-V1CertificateSigningRequest-new)

- [`V1CertificateSigningRequest$to_list()`](#method-V1CertificateSigningRequest-to_list)

- [`V1CertificateSigningRequest$clone()`](#method-V1CertificateSigningRequest-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CertificateSigningRequest$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CertificateSigningRequest$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CertificateSigningRequest$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
