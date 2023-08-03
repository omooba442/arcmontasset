<?php
$host   = 'localhost';
$uname  = 'root';
$pswrd  = "";
$dbname = 'test';

$conn   = mysqli_connect($host, $uname, $pswrd, $dbname);

if(!$conn) {
    die('[:FAILED:] '. mysqli_connect_error());
}
?>