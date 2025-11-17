#!/bin/bash

input=0

if [[ $input -lt 1 || $input -gt 100 ]];
 then
        echo " Dime un número "
	read input
fi

input=($input * 42)
echo " $input "

exit 0
