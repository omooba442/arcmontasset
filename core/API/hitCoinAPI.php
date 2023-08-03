
<?php

// $requestMethod  = $_SERVER['REQUEST_METHOD'];
if(true/*$requestMethod==='POST'*/) {
    // $slug = $_POST['slug'];
    $url = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';
    //$slug must compulsorily be in lowercase and be written without abbreviations
    $parameters = [ 'symbol'=>'btc' ];
    $headers = [
    'Accepts: application/json',
    /* API key, may be placed in the .env file */
    'X-CMC_PRO_API_KEY: 36e51f69-49cb-4b94-8dd2-ba447ffdd3fd'
    ];
    $qs = http_build_query($parameters); // query string encode the parameters
    $request = "{$url}?{$qs}"; // create the request URL


    $curl = curl_init(); // Get cURL resource
    // Set cURL options
    curl_setopt_array($curl, array(
    CURLOPT_URL => $request,            // set the request URL
    CURLOPT_HTTPHEADER => $headers,     // set the headers 
    CURLOPT_RETURNTRANSFER => 1         // ask for raw response instead of bool
    ));

    $response = curl_exec($curl); // Send the request, save the response
    //print_r(json_decode($response)); // print json decoded response
    print_r($response);
    return $response;
    curl_close($curl); // Close request
}
?>