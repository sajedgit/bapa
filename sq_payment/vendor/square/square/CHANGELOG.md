# Change Log

## Version 6.2.0.20200812 (2020-08-12)
## API releases
* Subscriptions API (beta):
  * For an overview, see [Square Subscriptions.](https://developer.squareup.com/docs/subscriptions/overview)
  * For technical reference, see [Subscriptions API.](https://developer.squareup.com/reference/square_2020-08-12/subscriptions-api)

## Existing API updates
* Catalog API
	* [CatalogSubscriptionPlan](https://developer.squareup.com/reference/square_2020-08-12/objects/CatalogSubscriptionPlan) (beta). This catalog type is added in support of the Subscriptions API. Subscription plans are stored as catalog object of the `SUBSCRIPTION_PLAN` type. For more information, see [Set Up and Manage a Subscription Plan.](https://developer.squareup.com/docs/subscriptions-api/setup-plan)

## SqPaymentForm SDK updates
* [SqPaymentForm.masterpassImageURL.](https://developer.squareup.com/docs/api/paymentform#masterpassimageurl) This function is updated to return a Secure Remote Commerce background image URL.

## Documentation updates
* Locations API
	* [About the main location.](https://developer.squareup.com/docs/locations-api#about-the-main-location) Added  clarifying information about the main location concept.
* OAuth API
	* [Migrate to the Square API OAuth Flow.](https://developer.squareup.com/docs/oauth-api/migrate-to-square-oauth-flow) Added a new topic to document migration from a v1 location-scoped OAuth access token to the Square seller-scoped OAuth access token.
* Payment Form SDK
  * Renamed the Add a Masterpass Button topic to [Add a Secure Remote Commerce Button.](https://developer.squareup.com/docs/payment-form/add-digital-wallets/masterpass) Updated the instructions to add a Secure Remote Commerce button to replace a legacy Masterpass button.
  * [Payment form technical reference.](https://developer.squareup.com/docs/api/paymentform) Updated the reference to show code examples for adding a Secure Remote Commerce button.

## Version 6.1.0.20200722 (2020-07-22)
## API releases

* Invoices API (beta):
  * For an overview, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
  * For technical reference, see [Invoices API](https://developer.squareup.com/reference/square_2020-07-22/invoices-api).

## Existing API updates

* Catalog API
	* [SearchCatalogItems](https://developer.squareup.com/reference/square_2020-07-22/catalog-api/search-catalog-items). You can now call the new search endpoint to [search for catalog items or item variations](https://developer.squareup.com/docs/catalog-api/search-catalog-items), with simplified programming experiences, using one or more of the supported query filters, including the custom attribute value filter.
* Locations API
  * [Locations API Overview](https://developer.squareup.com/docs/locations-api). Introduced the "main" location concept. 
  * [RetrieveLocation](https://developer.squareup.com/reference/square_2020-07-22/locations-api/retrieve-location). You can now specify "main" as the location ID to retrieve the main location information.

* Merchants API
  * [RetrieveMerchant](https://developer.squareup.com/reference/square_2020-07-22/merchants-api/retrieve-merchant) and [ListMerchants](https://developer.squareup.com/reference/square_2020-07-22/merchants-api/retrieve-merchant). These endpoints now return a new field, `main_location_id`.

* Orders API 
  * [PricingOptions](https://developer.squareup.com/reference/square_2020-07-22/objects/Order#definition__property-pricing_options). You can now enable the `auto_apply_discounts` of the options to have rule-based discounts automatically applied to an [Order](https://developer.squareup.com/reference/square_2020-07-22/objects/Order) that is pre-configured with a [pricing rule](https://developer.squareup.com/reference/square_2020-07-22/objects/CatalogPricingRule). 

* [Inventory API](https://developer.squareup.com/reference/square_2020-07-22/inventory-api)
	* Replaced 500 error on max string length exceeded with a max length error message. Max length attribute added to string type fields.

* Terminal API (beta)
	* [TerminalCheckout](https://developer.squareup.com/reference/square_2020-07-22/objects/TerminalCheckout) object. The `TerminalCheckoutCancelReason` field is renamed to `ActionCancelReason`.

## Documentation updates

* Catalog API
	* [Search a catalog](https://developer.squareup.com/docs/catalog-api/search-catalog). New topics added to provide actionable guides to using the existing [SearchCatalogObjects](https://developer.squareup.com/reference/square_2020-07-22/catalog-api/search-catalog-objects) endpoint, in addition to the [SearchCatalogItems](https://developer.squareup.com/reference/square_2020-07-22/catalog-api/search-catalog-items) endpoints.

* Orders API
	* [Create Orders](https://developer.squareup.com/docs/orders-api/create-orders). Updated existing content with the new pricing option for the automatic application of rule-based discounts. 


## Version 6.0.0.20200625 (2020-06-25)

## New API release 
* Team API generally available (GA)
  * For an overview, see [Team API Overview](https://developer.squareup.com/docs/team/overview).
  * For technical reference, see [Team API](https://developer.squareup.com/reference/square_2020-06-25/team-api).

## Existing API updates 
* Catalog API
  * [Pricing](https://developer.squareup.com/reference/square_2020-06-25/objects/CatalogPricingRule) is now GA. It allows an application to configure catalog item pricing rules for the specified discounts to apply automatically.
* Payments API
  * The [CardPaymentDetails](https://developer.squareup.com/reference/square_2020-06-25/objects/CardPaymentDetails) type now supports a new field, [refund_requires_card_presence](https://developer.squareup.com/reference/square_2020-06-25/objects/CardPaymentDetails#definition__property-refund_requires_card_presence). When set to true, the payment card must be physically present to refund a payment.

## Version 5.0.0.20200528 (2020-05-28)
## Square SDK - PHP 
Square is excited to announce the public release of customized SDK for PHP

To align with other Square SDKs generated for SQUARE API version 2020-05-28, the initial version of this PHP SDK is 5.0.0.20200528