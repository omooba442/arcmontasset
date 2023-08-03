<?php
function map($items, $func) {
	$results = [];
	foreach ($items as $item) {
		$results[] = $func($item);
	}
	return $results;
}
function query($params) {
  global $conn;
  $schema = [
    'p' => ['SELECT', 'FROM', 'WHERE'],
    'i' => ['INSERT', 'FROM', 'WHERE'],
    'r' => ['DELETE', 'FROM', 'WHERE'],
    'u' => ['UPDATE', 'SET', 'WHERE']
  ];
  // DELETE FROM `users` WHERE `users`.`id` = 22 
  global $queried;
  $id     = mysqli_real_escape_string($conn, $params['id']);
  $scope  = mysqli_real_escape_string($conn, $params['scp']);
  $at     = mysqli_real_escape_string($conn, $params['at']);
  $limit  = mysqli_real_escape_string($conn, $params['l']);
  $scheme = $schema[mysqli_real_escape_string($conn, $params['sc'])];
  $query  = "$scheme[0] $scope $scheme[1] $at $scheme[2] `id` = $id LIMIT $limit";
  $result = mysqli_query($conn, $query);
  
  if(mysqli_num_rows($result) > 0) {
    $queried = mysqli_fetch_array($result);
    while ($row = mysqli_fetch_array($result)) {
      $gen = map($row, function($column) {
        return $column;
      });
    }
    $data = [
      'status' => 200,
      'message' => 'OK - User details Fetched successfully',
      'id' => $id
    ];
  } else {
    $data = [
      'status' => 404,
      'message' => 'Nothing of that sort was found',
    ];
  }
  return ['scheme'=>$scheme, 'metadata'=>$data, 'data'=>$queried, 'query'=>$query];
}
?>