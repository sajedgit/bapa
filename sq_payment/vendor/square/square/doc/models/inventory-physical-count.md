## Inventory Physical Count

Represents the quantity of an item variation that is physically present
at a specific location, verified by a seller or a seller's employee. For example,
a physical count might come from an employee counting the item variations on
hand or from syncing with an external system.

### Structure

`InventoryPhysicalCount`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `?string` | Optional | A unique ID generated by Square for the<br>[InventoryPhysicalCount](#type-inventoryphysicalcount). |
| `referenceId` | `?string` | Optional | An optional ID provided by the application to tie the<br>[InventoryPhysicalCount](#type-inventoryphysicalcount) to an external<br>system. |
| `catalogObjectId` | `?string` | Optional | The Square generated ID of the<br>`CatalogObject` being tracked. |
| `catalogObjectType` | `?string` | Optional | The `CatalogObjectType` of the<br>`CatalogObject` being tracked. Tracking is only<br>supported for the `ITEM_VARIATION` type. |
| `state` | [`?string (InventoryState)`](/doc/models/inventory-state.md) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `locationId` | `?string` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items are being tracked. |
| `quantity` | `?string` | Optional | The number of items affected by the physical count as a decimal string.<br>Can support up to 5 digits after the decimal point. |
| `source` | [`?SourceApplication`](/doc/models/source-application.md) | Optional | Provides information about the application used to generate a change. |
| `employeeId` | `?string` | Optional | The Square ID of the [Employee](#type-employee) responsible for the<br>physical count. |
| `occurredAt` | `?string` | Optional | A client-generated timestamp in RFC 3339 format that indicates when<br>the physical count took place. For write actions, the `occurred_at`<br>timestamp cannot be older than 24 hours or in the future relative to the<br>time of the request. |
| `createdAt` | `?string` | Optional | A read-only timestamp in RFC 3339 format that indicates when Square<br>received the physical count. |

### Example (as JSON)

```json
{
  "id": null,
  "reference_id": null,
  "catalog_object_id": null,
  "catalog_object_type": null,
  "state": null,
  "location_id": null,
  "quantity": null,
  "source": null,
  "employee_id": null,
  "occurred_at": null,
  "created_at": null
}
```
