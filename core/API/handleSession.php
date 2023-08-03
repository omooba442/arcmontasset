
<?php
require './utils.php';
require './dbconn.php';

// set basic headers imperative to APIs  
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
// only allow POST requests
header('Access-Control-Allow-Method: POST');
header('Access-Control-Allow-Headers: Content-type, Access-Control-Allow-Headers, Authorization, X-Request-With');

$error    = [
  'status'=>404,
  'message'=>'N/A'
];

/**
 * POST HTTP verbs are favoured for both reading and writing the db because of the sensitive info conveyed
 */
$requestedMethod = $_SERVER['REQUEST_METHOD'];
if($requestedMethod==='POST') {
  $username = $_POST['username'];
  $mode = $_POST['mode'];
  $id   = $_POST['id']; //id may be empty or null but mode will be either "read" or "write"

  if($mode==='read') {
    echo json_encode(readDB($username));
  } else if($mode==='write') {
    writeDB();
  }
}

function writeDB($balance, $id) {
  global $conn;
  $query  = "UPDATE `users` SET `balance` = $balance WHERE id = $id";
  return standard($conn->query($query), '');
}

function standard($arg, $message) {
  $message&&($error['message']=$message);
  return $arg ? ['status'=> 200,'message'=> $arg] : $error;
}

function readDB($username) {
  global $conn;
  $query   = "SELECT username, id, balance FROM `users`";
  $result  = mysqli_query($conn, $query);
  $added   = '';

  while($row = $result->fetch_assoc()) {
    $added = $row['id'].'|'.$row['username'].'-'.$row['balance'];
    if($row['username']===$username) {
      $res = $added;
      break;
    }
  }
  return standard($added, '');
}