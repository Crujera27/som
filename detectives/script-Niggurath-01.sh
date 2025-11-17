#!/bin/bash

totalPuppies=0
rituales=0
salvados=0
dayyear=1

enero=31
febrero=28
marzo=31
abril=30
mayo=31
junio=30
julio=31
agosto=31
septiembre=30
octubre=31
noviembre=30
diciembre=31

mes() {
    days=$1
    mes=$2
    for day in $(seq 1 $days); do
        puppies=$(($RANDOM % 9 + 1))
        totalPuppies=$(($totalPuppies + $puppies))
        if [ $dayyear -eq 1 ] || [ $(($dayyear % 29)) -eq 1 ]; then
            salvados=$(($salvados + $puppies))
        else
            if [ $(($puppies % 3)) -eq 0 ]; then
                rituales=$(($rituales + 1))
                echo " DÍA $day/$mes: Total puppies: $totalPuppies "
            else
                echo " DÍA $day/$mes: Puppies nacidos hoy: $puppies "
            fi
        fi
        dayyear=$(($dayyear + 1))
    done
}

mes $enero 1
mes $febrero 2
mes $marzo 3
mes $abril 4
mes $mayo 5
mes $junio 6
mes $julio 7
mes $agosto 8
mes $septiembre 9
mes $octubre 10
mes $noviembre 11
mes $diciembre 12

echo " Rituales: $rituales "
echo " Total puppies: $totalPuppies "
echo " Puppies salvados: $salvados "

exit 0
