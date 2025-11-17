#!/bin/bash

for f in $(ls -l $HOME | wc -l); do
	echo " * Esto es $f"
done

exit 0
