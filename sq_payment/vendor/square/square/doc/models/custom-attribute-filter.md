## Custom Attribute Filter

Supported custom attribute query expressions for calling the
[SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems)
endpoint to search for items or item variations.

### Structure

`CustomAttributeFilter`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customAttributeDefinitionId` | `?string` | Optional | A query expression to filter items or item variations by matching their custom attributes'<br>`custom_attribute_definition_id`  <br>property value against the the specified id. |
| `key` | `?string` | Optional | A query expression to filter items or item variations by matching their custom attributes'<br>`key` property value against<br>the specified key. |
| `stringFilter` | `?string` | Optional | A query expression to filter items or item variations by matching their custom attributes'<br>`string_value`  property value<br>against the specified text. |
| `numberFilter` | [`?Range`](/doc/models/range.md) | Optional | The range of a number value between the specified lower and upper bounds. |
| `selectionUidsFilter` | `?(string[])` | Optional | A query expression to filter items or item variations by matching  their custom attributes'<br>`selection_uid_values`<br>values against the specified selection uids. |
| `boolFilter` | `?bool` | Optional | A query expression to filter items or item variations by matching their custom attributes'<br>`boolean_value` property values<br>against the specified Boolean expression. |

### Example (as JSON)

```json
{
  "custom_attribute_definition_id": null,
  "key": null,
  "string_filter": null,
  "number_filter": null,
  "selection_uids_filter": null,
  "bool_filter": null
}
```

