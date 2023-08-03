<?php

// set basic headers imperative to APIs  
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
// only allow POST requests
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-type, Access-Control-Allow-Headers, Authorization, X-Request-With');

include('work.php');

$requestMethod = $_SERVER['REQUEST_METHOD'];
if($requestMethod=='POST') {
    $data = work($_POST);
		
} else {
	$data = [
		'status' => 405,
		'message' => $requestMethod.'- Method Invalid'
	];
	header('HTTP/1.0 '.$data['status'].$data['message']);
}
// echo json_encode($data);
print_r($data)
?>