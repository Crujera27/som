#!/bin/bash

ls $HOME

echo -n " Indique el nombre de la carpeta: "

read CARPENOMBRE

echo " El nombre introducido es $CARPENOMBRE"
touch $HOME/$CARPENOMBRE/EstuvoAqui.txt

echo " El fichero se ha creado " 

exit 0
