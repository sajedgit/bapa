<?php






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