#!/bin/bash


#set -x

read -p "Número " input
echo " $input "


primo(){
	rm /tmp/primo
	touch /tmp/primo
	num=$1
	output=0
	for ((i = 2; i <= $(($num/2)); ++i)); do
        	if [ $(($num % $i)) -eq 0 ]; then
                	output=1
                	break
        	fi
	done
	
	if [ $output -eq 0 ]; then
		echo "Guardado como primo"
        	echo 1 > /tmp/primo
	else
		echo "guardando como NO primo"
	       	echo 0 > /tmp/primo
	fi

}

current=$((input))
echo " actual: $current " 
results=0
out1=0
out2=0
out3=0


while [[ true ]]; do
	if [[ $results = 3 ]]
	then
		echo " Los resultados son $out1, $out2 y $out3"
		break
	fi
	echo " check 1 pasado "
	if [[ $current = $input ]]
         then
		echo "sum uno"
		current=$((current+1))
		continue
        fi
	echo " check 2 pasado "
	primo $current
	sleep 1
	outprimo=$(cat /tmp/primo)
	echo " output del archivo "
	cat /tmp/primo 
	echo " llamada a primo completada"
	if [[ outprimo -eq "1" ]];
	 then
		echo " Comprobado el número $current "
		primo $current
		sleep 1
		outprimo=$(cat /tmp/primo)
		if [[ outprimo -eq 1 ]];
		then
			if [[ out1 -eq 0 ]];
			then
				out1=$(($current))
			fi
			if [[ out2 -eq 0 ]];
			then
				out2=$(($current))
			fi
			if [[ out3 -eq 0 ]];
			then
				out3=$(($current))
			fi
			echo -n " salida 1: $out1 \n salida 2: $out2 \n salida 3: $out3 \n"
			results=$(($results+1))
			current=$(($current+1))
			echo " resultados actuales $results "
			continue
			
		else
			echo "$current no es primo"
			current=$(($current+1))
			continue
		fi 
	 else
		echo "$current el número no es primo, check final fallido"
		current=$(($current+1))
		echo " resultado del output de la funcion:"
		cat /tmp/primo
		echo " valor de la variable: $outprimo"
		sleep 3
	fi






done

exit 0
