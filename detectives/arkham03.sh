#!/bin/bash

WEST_STREET_NUMPASOS="100"
BOUNDARY_STREET_NUMPASOS="200"
CRANE_STREET_NUMPASOS="50"
PARALELA_CRANE_STREET_NUMPASOS="50"
COLLEGE_STREET_NUMPASOS="300"

TOTAL_NUMPASOS=0

read -p "min" min

#min=$(date +"%M")

echo " Minuto actual:  $min " 

patrulla(){
	rm /tmp/patrulla 2> /dev/null
	if [ $min -le 15 ]; then
		echo "1" > /tmp/patrulla
	elif [ $min -le 30 ]; then
		echo "2" > /tmp/patrulla
	elif [ $min -le 45 ]; then
		echo "3" > /tmp/patrulla
	elif [ $min -le 60 ]; then
		echo "4" > /tmp/patrulla
	fi
}

fast(){
	echo "fast: $1"
	no=$1
	rm /tmp/fast 2> /dev/null
	if [ $no -eq 1 ]; then
		echo "No hay rutas disponibles actualmente, la patrulla está en West St."
	elif [ $no -eq 2 ]; then
		echo "No hay rutas disponibles actualmente, la patrulla esstá en Boundary St."
	elif [ $no -eq 3 ]; then
		echo "Tienes que ir por Boundary St hasta la paralela sud de Crane St."
		echo "Caminaras un total de ${PARALELA_CRANE_STREET_NUMPASOS+BOUNDARY_STREET_NUMPASOS}"
	elif [ $no -eq 4 ]; then
		echo "Tienes que ir por Boundary St hasta Crane St para luego ir a West St y finalmente a College St."
		echo "Caminaras un total de ${CRANE_STREET_NUMPASOS+BOUNDARY_STREET_NUMPASOS+COLLEGE_STREET_NUMPASOS}"
	fi

}
patrulla min

patrulla=$(cat /tmp/patrulla)
echo "La patrulla está en $patrulla"

fast $patrulla


exit 0
