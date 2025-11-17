#!/bin/bash

echo -n " Indique el nombre de la carpeta: "
read CARPENOMBRE

echo " El nombre introducido es $CARPENOMBRE"

mkdir -p /tmp/nivel1/$CARPENOMBRE

exit 0
