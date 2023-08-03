<?php

$fileName      = 'checked.txt'; 
$checked       = false;
$fh = fopen($fileName, 'w+') or die('Cannot open file');

if($_SERVER['REQUEST_METHOD'] =='POST') {
  $checked = $_POST['checked'];
  fwrite($fh, $checked);
}
fclose($fh);
echo $checked;
?>