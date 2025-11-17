#!/bin/bash

input=""
echo " $input "
while [[ $input != "yes" && $input != "no" ]]; do
	sleep 1 
	echo " Confirmación "
	read input
done

echo " $input " 

if [[ $input = "yes" ]];
 then
        echo " I love the bucles"
 else
	echo "What a pity, a boring person"
fi

exit 0
