#!/bin/bash

echo " Dime un número"
read num
while [ $num -lt 100 ]; do
	num=$(($num * 2))
done
echo " $num "

exit 0
