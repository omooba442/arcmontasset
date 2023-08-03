<?php
function map($items, $func) {
	$results = [];
	foreach ($items as $item) {
		$results[] = $func($item);
	}
	return $results;
}
function find($items, $fn, $asArray, $extra) {
  $i=0;
  foreach($items as $item) {
    if($fn($item, $i++, $extra)) {
      return $asArray ? [$item, $i] : $item;
    } 
  }
}
