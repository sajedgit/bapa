## Search Invoices Request

Describes a `SearchInvoices` request.

### Structure

`SearchInvoicesRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `query` | [`InvoiceQuery`](/doc/models/invoice-query.md) |  | Describes query criteria for searching invoices. |
| `limit` | `?int` | Optional | The maximum number of invoices to return (200 is the maximum `limit`).<br>If not provided, the server<br>uses a default limit of 100 invoices. |
| `cursor` | `?string` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this cursor to retrieve the next set of results for your original query.<br><br>For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination). |

### Example (as JSON)

```json
{
  "query": {
    "filter": {
      "location_ids": [
        "ES0RJRZYEC39A"
      ],
      "customer_ids": [
        "JDKYHBWT1D4F8MFH63DBMEN8Y4"
      ]
    },
    "sort": {
      "field": "INVOICE_SORT_DATE",
      "order": "DESC"
    },
    "limit": 100
  }
}
```

