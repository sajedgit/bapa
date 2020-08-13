## Subscription

Represents a customer subscription to a subscription plan.
For an overview of the `Subscription` type, see
[Subscription object](https://developer.squareup.com/docs/docs/subscriptions-api/overview#subscription-object-overview).

### Structure

`Subscription`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `?string` | Optional | The Square-assigned ID of the subscription. |
| `locationId` | `?string` | Optional | The ID of the location associated with the subscription. |
| `planId` | `?string` | Optional | The ID of the associated [subscription plan](#type-catalogsubscriptionplan). |
| `customerId` | `?string` | Optional | The ID of the associated [customer](#type-customer) profile. |
| `startDate` | `?string` | Optional | The start date of the subscription, in YYYY-MM-DD format (for example,<br>2013-01-15). |
| `canceledDate` | `?string` | Optional | The subscription cancellation date, in YYYY-MM-DD format (for<br>example, 2013-01-15). On this date, the subscription status changes<br>to `CANCELED` and the subscription billing stops.<br>If you don't set this field, the subscription plan dictates if and<br>when subscription ends.<br><br>You cannot update this field, you can only clear it. |
| `status` | [`?string (SubscriptionStatus)`](/doc/models/subscription-status.md) | Optional | Possible subscription status values. |
| `taxPercentage` | `?string` | Optional | The tax amount applied when billing the subscription. The<br>percentage is expressed in decimal form, using a `'.'` as the decimal<br>separator and without a `'%'` sign. For example, a value of `7.5`<br>corresponds to 7.5%. |
| `invoiceIds` | `?(string[])` | Optional | The IDs of the [invoices](#type-invoice) created for the<br>subscription, listed in order when the invoices were created<br>(oldest invoices appear first). |
| `priceOverrideMoney` | [`?Money`](/doc/models/money.md) | Optional | Represents an amount of money. `Money` fields can be signed or unsigned.<br>Fields that do not explicitly define whether they are signed or unsigned are<br>considered unsigned and can only hold positive amounts. For signed fields, the<br>sign of the value indicates the purpose of the money transfer. See<br>[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)<br>for more information. |
| `version` | `?int` | Optional | The version of the object. When updating an object, the version<br>supplied must match the version in the database, otherwise the write will<br>be rejected as conflicting. |
| `createdAt` | `?string` | Optional | The timestamp when the subscription was created, in RFC 3339 format. |
| `cardId` | `?string` | Optional | The ID of the [customer](#type-customer) [card](#type-card)<br>that is charged for the subscription. |
| `paidUntilDate` | `?string` | Optional | The date up to which the customer is invoiced for the<br>subscription, in YYYY-MM-DD format (for example, 2013-01-15).<br><br>After the invoice is paid for a given billing period,<br>this date will be the last day of the billing period.<br>For example,<br>suppose for the month of May a customer gets an invoice<br>(or charged the card) on May 1. For the monthly billing scenario,<br>this date is then set to May 31. |
| `timezone` | `?string` | Optional | Timezone that will be used in date calculations for the subscription.<br>Defaults to the timezone of the location based on `location_id`.<br>Format: the IANA Timezone Database identifier for the location timezone (for example, `America/Los_Angeles`). |

### Example (as JSON)

```json
{
  "id": null,
  "location_id": null,
  "plan_id": null,
  "customer_id": null,
  "start_date": null,
  "canceled_date": null,
  "status": null,
  "tax_percentage": null,
  "invoice_ids": null,
  "price_override_money": null,
  "version": null,
  "created_at": null,
  "card_id": null,
  "paid_until_date": null,
  "timezone": null
}
```

