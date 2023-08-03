<?php
require '../vendor/predis/predis/autoload.php';
require './dbconn.php';
require './utils.php';

global $conn;

$redis  = new Predis\Client();
$requestMethod = $_SERVER['REQUEST_METHOD'];
if($requestMethod=='POST') {
  $username = $_POST['username'];
  
  if($cached = $redis->get($username)) {
    echo $cached;
  } else {
    
    $query = "SELECT username, id, balance FROM `users`";
    $result  = mysqli_query($conn, $query);
    $cached = '';
    while($row = $result->fetch_assoc()) {
      if($row['username']==$username) {
        $redis->set($username, $cached = 
$row['id'].'-'.$row['balance']);
        break;
      }
    }
    echo $cached;
  }
}
?>
