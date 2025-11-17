#!/bin/bash

cont=0
while [[ cont -eq 0 ]]; do

sleep 1
echo "wait"
if [[ -e /tmp/si-existo-me-paro ]];
 then
	# /etc/apt/sources.list: No existe el archivo o el directorio
	echo " $(cat /etc/apt/sources.list.d/lliurex.sources | grep lliurex)" 
	count=1000
 else
	count=0
fi

done

exit 0
