## Invoice Query

Describes query criteria for searching invoices.

### Structure

`InvoiceQuery`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filter` | [`InvoiceFilter`](/doc/models/invoice-filter.md) |  | Describes query filters to apply. |
| `sort` | [`?InvoiceSort`](/doc/models/invoice-sort.md) | Optional | Identifies the  sort field and sort order. |

### Example (as JSON)

```json
{
  "filter": {
    "location_ids": [
      "location_ids4"
    ],
    "customer_ids": null
  },
  "sort": null
}
```

