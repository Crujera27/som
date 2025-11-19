#!/bin/bash


valip ()
{
    if [ -z "$1" ]; then
        echo 'no ip supplied' >&2

        exit 1
    fi

    OFS=$IFS
    IFS=.

    set -- $1

    IFS=$OFS

    if [ $# -ne 4 ]; then
        return 1
    fi

    for i; do
        # not a number
        case "$i" in
            ''|*[!0-9]*)
                return 1
                ;;
        esac

        # not in range 0-255
        if [ "$i" -lt 0 -o "$i" -gt 255 ]; then
            return 1
        fi
    done
}



while [[ True ]]; do 

	rm /tmp/ips.txt
	curl http://192.168.5.253:8000/ips-a-auditar.txt > /tmp/ips.txt
	ipPing=$(tail -n 1 /tmp/ips.txt)
	ipPingStop=$(tail -n 1 /tmp/ips.txt | grep -i "stop" && echo "1" || echo "2")
	echo $ipPingStop
	if [[ $ipPingStop != "2" ]] ; then
		echo "Señal de stop recibida"
		exit 1
	fi
	valip $ipPing
	echo $ipPing
	ping -c 4 $ipPing
	sleep 5
done

exit 0
