#!/bin/bash

echo -n " Indique su nombre de usuario : " 
read NOMBRE

echo " El nombre introducido es $NOMBRE"

mkdir -p /tmp/$NOMBRE

echo "El directorio se ha creado satisfactoriamente"

exit 0
