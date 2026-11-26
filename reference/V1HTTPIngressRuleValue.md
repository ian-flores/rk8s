# V1HTTPIngressRuleValue

V1HTTPIngressRuleValue

V1HTTPIngressRuleValue

## Details

HTTPIngressRuleValue is a list of http selectors pointing to backends.
In the example: http://\<host\>/\<path\>?\<searchpart\> -\> backend
where where parts of the url correspond to RFC 3986, this resource will
be used to match against everything after the last '/' and before the
first '?' or '#'.

## Methods

### Public methods

- [`V1HTTPIngressRuleValue$new()`](#method-V1HTTPIngressRuleValue-new)

- [`V1HTTPIngressRuleValue$to_list()`](#method-V1HTTPIngressRuleValue-to_list)

- [`V1HTTPIngressRuleValue$clone()`](#method-V1HTTPIngressRuleValue-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HTTPIngressRuleValue$new(paths = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HTTPIngressRuleValue$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HTTPIngressRuleValue$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
