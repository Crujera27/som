#!/bin/bash

count=0
while [[ cont != 1 ]]; do

if [[ -e /tmp/si-existo-me-paro ]];
 then
	break
fi
sleep 2
echo "Esperando"

done

exit 0
