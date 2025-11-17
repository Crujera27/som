#!/bin/bash

echo " Dime un número"
read num
while [ $num -lt 1000 ]; do
	num=$(($num + 123))
done
echo " $num "

exit 0
