#!/bin/bash

echo "Hostname: "
hostnamectl hostname

echo "IP"
hostname -I | awk '{print $1}'

echo "Máscara de subred"

ip -o -f inet addr show | grep -Po "/[[:digit:]]{1,2}(?=.*scope\sglobal)"

echo "Gateway"

ip -4 route show default

echo "MAC"

cat /sys/class/net/*/address


exit 0
