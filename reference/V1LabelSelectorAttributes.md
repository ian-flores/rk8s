# V1LabelSelectorAttributes

V1LabelSelectorAttributes

V1LabelSelectorAttributes

## Details

LabelSelectorAttributes indicates a label limited access. Webhook
authors are encouraged to \* ensure rawSelector and requirements are not
both set \* consider the requirements field if set \* not try to parse
or consider the rawSelector field if set. This is to avoid another
CVE-2022-2880 (i.e. getting different systems to agree on how exactly to
parse a query is not something we want), see
https://www.oxeye.io/resources/golang-parameter-smuggling-attack for
more details. For the \*SubjectAccessReview endpoints of the
kube-apiserver: \* If rawSelector is empty and requirements are empty,
the request is not limited. \* If rawSelector is present and
requirements are empty, the rawSelector will be parsed and limited if
the parsing succeeds. \* If rawSelector is empty and requirements are
present, the requirements should be honored \* If rawSelector is present
and requirements are present, the request is invalid.

## Methods

### Public methods

- [`V1LabelSelectorAttributes$new()`](#method-V1LabelSelectorAttributes-new)

- [`V1LabelSelectorAttributes$to_list()`](#method-V1LabelSelectorAttributes-to_list)

- [`V1LabelSelectorAttributes$clone()`](#method-V1LabelSelectorAttributes-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LabelSelectorAttributes$new(raw_selector = NULL, requirements = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LabelSelectorAttributes$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LabelSelectorAttributes$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
