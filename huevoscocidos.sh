#!/bin/bash

tcocinar=600

while [[ true ]]; do	

	read -p "Huevos máximo: " hmax

	if [[ $hmax ]]; then 
		echo " doop " >> /dev/null
	else
		echo "Tienes que proporcionar una entrada"
	fi
	if [[ $hmax -lt 3 ]]; then
		echo " El tamaño no puede ser menos que 3"
	fi
	if [[ $hmax -gt 10 ]]; then
		echo "El tamaño no puede ser mayor que 10"
	fi

	break

done

read -p "Huevos a cocer: " hnow

timeout=0
romper=0
while [[ true ]]; do

	echo hmax
	echo hnow
	if [[ hnow -le 0 ]]; then
		echo "Tiempo total necesario: $timeout segundos"
		break
	fi
	# case: el nº máx de huevos es igual o menor al  tamaño de la sarten
	if [[ hnow -ge hmax ]]; then
		timeout=$(echo "$hnow * $tcocinar" | bc)
		hnow=0
		hmax=0
		echo "$timeout"
		continue
	else # case: el nº de huevos no nos cabe
		echo ""
		hnow=
		#e=hnow
		#m=hmax
		for((timeout=0;hnow>0;hnow-=hmax>hnow?hnow:hmax,timeout+=600));do  :;done;
	fi

done
