## Subscription Phase

Describes a phase in a subscription plan. For more information, see
[Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/docs/subscriptions-api/setup-plan).

### Structure

`SubscriptionPhase`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `?string` | Optional | The Square-assigned ID of the subscription phase. |
| `cadence` | [`string (SubscriptionCadence)`](/doc/models/subscription-cadence.md) |  | Determines the billing cadence of a [Subscription](#type-Subscription) |
| `periods` | `?int` | Optional | The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. |
| `recurringPriceMoney` | [`Money`](/doc/models/money.md) |  | Represents an amount of money. `Money` fields can be signed or unsigned.<br>Fields that do not explicitly define whether they are signed or unsigned are<br>considered unsigned and can only hold positive amounts. For signed fields, the<br>sign of the value indicates the purpose of the money transfer. See<br>[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)<br>for more information. |
| `ordinal` | `?int` | Optional | The position this phase appears in the sequence of phases defined for the plan, indexed from 0. |

### Example (as JSON)

```json
{
  "uid": null,
  "cadence": "DAILY",
  "periods": null,
  "recurring_price_money": {
    "amount": null,
    "currency": null
  },
  "ordinal": null
}
```

