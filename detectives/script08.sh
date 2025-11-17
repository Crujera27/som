#!/bin/bash

mkdir -p $HOME/nivel8/{boston,arkham,casos}
mkdir -p $HOME/nivel8/sospechosos/{paulGraham,sofieCeres,augustusMoon,teloniusAres,nervThyonius}

echo -n " Dime el nombre del sospechoso : "

read SOSPECHOSO

if [ -d $SOSPECHOSO ]; then

	ln -s $HOME/nivel8/casaos/$SOSPECHOSO $HOME/nivel8/sospechosos/$sospechoso

fi

exit 0
