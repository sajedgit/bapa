<?php

// Note this line needs to change if you don't use Composer:
// require('square-php-sdk/autoload.php');
require 'vendor/autoload.php';
require 'header.php';

use Dotenv\Dotenv;
use Square\Models\CreateOrderRequest;
use Square\Models\CreateCheckoutRequest;
use Square\Models\Order;
use Square\Models\OrderLineItem;
use Square\Models\Money;
use Square\Models\BatchRetrieveOrdersRequest;
use Square\Exceptions\ApiException;
use Square\SquareClient;


$form_submit_url = $base_url . "after_payment_success_product";

// dotenv is used to read from the '.env' file created
$dotenv = Dotenv::create(__DIR__);
$dotenv->load();

// Pulled from the .env file and upper cased e.g. SANDBOX, PRODUCTION.
$upper_case_environment = strtoupper(getenv('ENVIRONMENT'));

// Use the environment and the key name to get the appropriate values from the .env file.
$access_token = getenv($upper_case_environment . '_ACCESS_TOKEN');
$location_id = getenv($upper_case_environment . '_LOCATION_ID');

// Initialize the authorization for Square
$client = new SquareClient([
    'accessToken' => $access_token,
    'environment' => getenv('ENVIRONMENT')
]);


$order_ids = [$_REQUEST["transactionId"]];
$body = new \Square\Models\BatchRetrieveOrdersRequest($order_ids);

$api_response = $client->getOrdersApi()->batchRetrieveOrders($location_id, $body);
$arr=array();
if ($api_response->isSuccess()) {

    $result = $api_response->getResult();
    $result_data = json_encode($result);
    $result_data = json_decode($result_data);

   // print_r($result_data->orders);

    $order = $result_data->orders[0];
    $arr["order_id"] = $order->id;
    $arr["source"] = $order->source->name;

    $item_arrrr=array();
    foreach ($order->line_items as $item) {
        $item_name = $item->name;
        $item_quantity = $item->quantity;
        $item_unit_price = $item->base_price_money->amount/100;
        $item_total_money = $item->total_money->amount/100;
        $item_currency = $item->total_money->currency;
        $items_data=array("item_name"=>$item_name,"item_unit_price"=>$item_unit_price,"item_quantity"=>$item_quantity,"item_total_money"=>$item_total_money,"item_currency"=>$item_currency);

        array_push($item_arrrr,$items_data);
    }


    $arr["items"] = $item_arrrr;
    $arr["note"] = $order->tenders[0]->note;
    $arr["net_amounts"] = $order->net_amounts->total_money->amount;


   // print_r(serialize($arr));
   $arr=htmlentities(serialize($arr));


    ?>
    <form id="myForm" method="post" action="<?php echo $form_submit_url; ?>">
        <input type="hidden" name="order_data[]" value="<?php echo $arr; ?>"/>
    </form>

    <script type="text/javascript">
        document.getElementById('myForm').submit();
    </script>

    <?php

} else {
    $errors = $api_response->getErrors();

}
 





