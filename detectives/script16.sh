#!/bin/bash

for f in $(find / -maxdepth 1 -name "m*"); do
	if [ -d $f ] ; then
		echo " * Muestrate! $f"
	fi
done

exit 0
