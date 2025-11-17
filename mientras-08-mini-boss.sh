#!/bin/bash

echo "Número"

read input

while [ $input -gt 3 ]; do
    if [ $((input % 2)) -ne 0 ] && [ $((input % 3)) -eq 0 ] && [ $((input % 5)) -eq 0 ]; then
        echo "$input es impar y divisible por 3 y 5"
        input=$((input - 2))
    else
        input=$((input - 1))
    fi
    echo "Número actual: $input"
done

echo "Fin"

exit 0
