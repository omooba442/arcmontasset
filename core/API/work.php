<?php
require './dbconn.php';
require './utils.php';
function work($params) {
  $data = query($params);
  
  // $query  = "SELECT `username`, `balance` FROM `users` WHERE `id` = $userId LIMIT 1";  
  header('HTTP/1.0 '.$data['metadata']['status'].$data['metadata']['message']);
  return $data;
}
?>