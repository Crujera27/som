#!/bin/bash

count=0
while [[ cont != 1 ]]; do

if [[ -e /tmp/si-existo-me-paro && $(ls -s /tmp/si-existo-me-paro|cut -d " " -f1) -gt 0 ]];
 then
	break
fi
sleep 2
echo "Esperando"

done

exit 0
