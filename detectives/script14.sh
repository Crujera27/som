#!/bin/bash

for f in [$(ls / )]; do
	if [ ! -d $f ]  ; then
		echo " * Muestrate! $f"
	fi
done

exit 0
