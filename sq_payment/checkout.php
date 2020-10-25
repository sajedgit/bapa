<?php

// Note this line needs to change if you don't use Composer:
// require('square-php-sdk/autoload.php');
require 'vendor/autoload.php';

use Dotenv\Dotenv;
use Square\Models\CreateOrderRequest;
use Square\Models\CreateCheckoutRequest;
use Square\Models\Order;
use Square\Models\OrderLineItem;
use Square\Models\Money;
use Square\Exceptions\ApiException;
use Square\SquareClient;

$base_url="http://localhost/bapa/";
$redirect_url=$base_url."sq_payment/after_payment.php";

// dotenv is used to read from the '.env' file created
$dotenv = Dotenv::create(__DIR__);
$dotenv->load();

// Pulled from the .env file and upper cased e.g. SANDBOX, PRODUCTION.
$upper_case_environment = strtoupper(getenv('ENVIRONMENT'));

// Use the environment and the key name to get the appropriate values from the .env file.
$access_token = getenv($upper_case_environment.'_ACCESS_TOKEN');
$location_id =  getenv($upper_case_environment.'_LOCATION_ID');

// Initialize the authorization for Square
$client = new SquareClient([
  'accessToken' => $access_token,
  'environment' => getenv('ENVIRONMENT')
]);

// make sure we actually are on a POST with an amount
// This example assumes the order information is retrieved and hard coded
// You can find different ways to retrieve order information and fill in the following lineItems object.
try {
  $checkout_api = $client->getCheckoutApi();

 // print_r($_REQUEST);die();

    $event_id=$_REQUEST['event_id'];

   if( isset($_REQUEST['adult_price']) )
   {
       $adult_price=$_REQUEST['adult_price']*100;
       $adult_label=$_REQUEST['adult_label'];
       $adult_quantity=$_REQUEST['adult_quantity'];

       // Monetary amounts are specified in the smallest unit of the applicable currency.
       // This amount is in cents. It's also hard-coded for $1.00, which isn't very useful.

       $money_A = new Money();
       $money_A->setCurrency('USD');
       $money_A->setAmount($adult_price);

       $item_A = new OrderLineItem($adult_quantity);
       $item_A->setName($adult_label);
       $item_A->setBasePriceMoney($money_A);
   }
   if(isset($_REQUEST['children_price']))
   {
       $children_price=$_REQUEST['children_price']*100;
       $children_label=$_REQUEST['children_label'];
       $children_quantity=$_REQUEST['children_quantity'];

       // Monetary amounts are specified in the smallest unit of the applicable currency.
       // This amount is in cents. It's also hard-coded for $1.00, which isn't very useful.

       $money_B = new Money();
       $money_B->setCurrency('USD');
       $money_B->setAmount($children_price);

       $item_B = new OrderLineItem($children_quantity);
       $item_B->setName($children_label);
       $item_B->setBasePriceMoney($money_B);
   }




  // Create a new order and add the line items as necessary.
  $order = new Order($location_id);
  if( isset($_REQUEST['children_price']) && isset($_REQUEST['adult_price']))
  {
      $order->setLineItems([$item_A, $item_B]);
  }
  elseif(isset($_REQUEST['adult_price']))
  {
      $order->setLineItems([$item_A]);
  }
  elseif(isset($_REQUEST['children_price']))
  {
      $order->setLineItems([ $item_B]);
  }
  else
  {
      "Select Nothing";die();
  }



  $create_order_request = new CreateOrderRequest();
  $create_order_request->setOrder($order);

  // Similar to payments you must have a unique idempotency key.
  $checkout_request = new CreateCheckoutRequest(uniqid(), $create_order_request);
  $checkout_request->setRedirectUrl($redirect_url);
  $checkout_request->setNote($event_id);

  $response = $checkout_api->createCheckout($location_id, $checkout_request);
    if ($response->isSuccess()) {
        $result = $response->getResult();
    } else {
        $errors = $response->getErrors();
    }
} catch (ApiException $e) {
  // If an error occurs, output the message
  echo 'Caught exception!<br/>';
  echo '<strong>Response body:</strong><br/>';
  echo '<pre>'; var_dump($e->getResponseBody()); echo '</pre>';
  echo '<br/><strong>Context:</strong><br/>';
  echo '<pre>'; var_dump($e->getContext()); echo '</pre>';
  exit();
}

// If there was an error with the request we will
// print them to the browser screen here
if ($response->isError()) {
  echo 'Api response has Errors';
  $errors = $response->getErrors();
  echo '<ul>';
  foreach ($errors as $error) {
      echo '<li>❌ ' . $error->getDetail() . '</li>';
  }
  echo '</ul>';
  exit();
}


// This redirects to the Square hosted checkout page
header('Location: '.$response->getResult()->getCheckout()->getCheckoutPageUrl());
