# V1JSONSchemaProps

V1JSONSchemaProps

V1JSONSchemaProps

## Details

JSONSchemaProps is a JSON-Schema following Specification Draft 4
(http://json-schema.org/).

## Methods

### Public methods

- [`V1JSONSchemaProps$new()`](#method-V1JSONSchemaProps-new)

- [`V1JSONSchemaProps$to_list()`](#method-V1JSONSchemaProps-to_list)

- [`V1JSONSchemaProps$clone()`](#method-V1JSONSchemaProps-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JSONSchemaProps$new(
      `_ref` = NULL,
      `_schema` = NULL,
      additional_items = NULL,
      additional_properties = NULL,
      all_of = NULL,
      any_of = NULL,
      default = NULL,
      definitions = NULL,
      dependencies = NULL,
      description = NULL,
      enum = NULL,
      example = NULL,
      exclusive_maximum = NULL,
      exclusive_minimum = NULL,
      external_docs = NULL,
      format = NULL,
      id = NULL,
      items = NULL,
      max_items = NULL,
      max_length = NULL,
      max_properties = NULL,
      maximum = NULL,
      min_items = NULL,
      min_length = NULL,
      min_properties = NULL,
      minimum = NULL,
      multiple_of = NULL,
      not = NULL,
      nullable = NULL,
      one_of = NULL,
      pattern = NULL,
      pattern_properties = NULL,
      properties = NULL,
      required = NULL,
      title = NULL,
      type = NULL,
      unique_items = NULL,
      x_kubernetes_embedded_resource = NULL,
      x_kubernetes_int_or_string = NULL,
      x_kubernetes_list_map_keys = NULL,
      x_kubernetes_list_type = NULL,
      x_kubernetes_map_type = NULL,
      x_kubernetes_preserve_unknown_fields = NULL,
      x_kubernetes_validations = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1JSONSchemaProps$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JSONSchemaProps$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
