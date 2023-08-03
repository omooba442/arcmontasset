#!/bin/sh
 
ps aux | grep '[m]yScript.php'
if [ $? -ne 0 ]
then
    php /path/to/myScript.php
    wget '<crypto API url>' -O 'output-file'
fi