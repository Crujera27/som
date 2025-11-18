#!/bin/bash



while [[ True ]]; do 

	rm /tmp/ips.txt
	curl http://192.168.5.253:8000/ips-a-auditar.txt > /tmp/ips.txt
	ipPing=$(tail -n 1 /tmp/ips.txt)
	echo $ipPing
	ping -c 2 $ipPing
	sleep 5
done

exit 0
