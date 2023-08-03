<?php
$fileName = 'checked.txt';
$fh       = fopen($fileName, 'w+') or die('Cannot open file');
$checked  = false;
$requestMethod = $_SERVER['REQUEST_METHOD'];
if($requestMethod == 'POST') {
  $checked = $_POST['checked'];
  fwrite($fh, $checked);
}
fclose($fh);
echo $checked;
?>