#!/bin/bash


S2="Ambar"
S6="Ambar"
S8="Ambar"

echo " Bienvenido al sistema de tráfico de arkham "
echo " ---> Accediendo a RiverStreet"
sleep 0.5
echo " ---> Indique que semaforo desea establecer en verde"
echo " 2) "
echo " 6)"
echo " 8)"
echo -n " Número semaforo ? : "

read SEMAFORO_ACTUAL

if [ $SEMAFORO_ACTUAL -eq 2 ] ; then
	S6="Rojo"
	S8="Rojo"
	S2="Verde"
elif [ $SEMAFORO_ACTUAL -eq 6 ] ; then

        S6="Verde"
        S8="Rojo"
        S2="Rojo"
elif [ $SEMAFORO_ACTUAL -eq 8 ] ; then

        S6="Rojo"
        S8="Verde"
        S2="Rojo"
else
	echo "Semaforo no encontrado"
	exit 1
fi



echo " Semaforo Calle 2 : $S2"
echo " Semaforo Calle 6 : $S6"
echo " Semaforo Calle 8 : $S8"

exit 0
