#!/bin/bash

#set -x

preppi(){
        if [[ $1 ]] ; then
                pi=$1
        else
                pi=$(cat ./pi.txt)
                if [[ ! $pi ]] || [[ $pi -le 0 ]] ; then
                        echo "Pi no proporcionado"
                        exit 1
                fi
        fi
}

primo(){
        rm -f /tmp/primo
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
                echo 1 > /tmp/primo
        else
                echo 0 > /tmp/primo
        fi
}

factorial(){
        num=$1
        result=1
        for ((i = 2; i <= $num; i++)); do
                result=$(($result * $i))
        done
        echo $result
}

mcd(){
        a=$1
        b=$2
        while [ $b -ne 0 ]; do
                temp=$b
                b=$(($a % $b))
                a=$temp
        done
        echo $a
}

#mcd(){
#       a=$1
#       b=$2
#       factors_a=$(factor $a | cut -d: -f2)
#       factors_b=$(factor $b | cut -d: -f2)
#       result=1
#       for fa in $factors_a; do
#               for fb in $factors_b; do
#                       if [ $fa -eq $fb ]; then
#                               result=$(($result * $fa))
#                               break 2
#                       fi
#               done
#       done
#       echo $result
#}

mcm(){
        a=$1
        b=$2
        divisor=$(mcd $a $b)
        result=$(($a * $b / $divisor))
        echo $result
}

while [[ true ]]; do
        echo "-----------------------------"
        echo " Bienvenido a la calculadora "
        echo " Selecciona la operación: "
        echo " 1) Suma "
        echo " 2) Resta "
        echo " 3) Multiplicación "
        echo " 4) División "
        echo " 5) Área del rectangulo "
        echo " 6) Volumen de una esfera "
        echo " 7) Minimo Comun Multiple "
        echo " 8) Maximo Comun Divisor "
        echo " q) Salir "
        echo "-----------------------------"
        read -p "Opción: " input
        echo "Entrada: $input "
        if [[ $input -eq 1 ]] ; then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(echo "$in1 + $in2" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 2 ]] ;  then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(echo "$in1 - $in2" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 3 ]] ; then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(echo "$in1 * $in2" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 4 ]] ; then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(echo "scale=4; $in1 / $in2" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 5 ]]; then
                read -p "Lado 1: " in1
                read -p "Lado 2: " in2
                out=$(echo "$in1 * $in2" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 6 ]]; then
                read -p "Radio: " in1
                preppi
                out=$(echo "scale=4; (4/3*$pi*$in1^3)" | bc)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 7 ]]; then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(mcm $in1 $in2)
                echo " Resultado de la operación: $out "
        elif [[ $input -eq 8 ]]; then
                read -p " Entrada 1: " in1
                read -p " Entrada 2: " in2
                out=$(mcd $in1 $in2)
                echo " Resultado de la operación: $out "
        elif [[ $input = "q" ]] ; then
                echo "Adios"
                break
        fi
        echo -e "\n"
done

exit 0
