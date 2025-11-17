#!/bin/bash

for f in $(find $HOME -maxdepth 1 -name "d*"); do
	if [ -d $f ] ; then
		echo " * Muestrate! $f"
	fi
done

exit 0
