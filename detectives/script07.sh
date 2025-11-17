#!/bin/bash

mkdir -p  $HOME/nivel7
mkdir -p $HOME/nivel7/{boston,arkham,casos}
mkdir -p $HOME/nivel7/sospechosos/{paulGraham,sofieCeres,agustusMoon,teloniusAres,nervThyonius}

echo -n " Dime el nombre del sospechoso : "

read SOSPECHOSO

if [ -d $SOSPECHOSO ]; then

	cp -r $HOME/nivel7/sospechosos/ $HOME/nivel7/casaos/

else

	echo "El sospechoso no es válido"

fi

exit 0
