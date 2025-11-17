#!/bin/bash

for f in $(ls /); do
	if [ ! -e $f ] ; then 
		echo " * Muestrate! $f"
	fi
done

exit 0
