#!/bin/bash

d2b() {
    read -p "Decimal: " n
    echo "Binario: $(echo "obase=2; $n" | bc)"
}

d2r() {
    read -p "Decimal (1-3999): " n
    m=$((n/1000)); c=$(( (n%1000)/100 )); d=$(( (n%100)/10 )); u=$(( n%10 ))
    M=("" M MM MMM); C=("" C CC CCC CD D DC DCC DCCC CM)
    D=("" X XX XXX XL L LX LXX LXXX XC); U=("" I II III IV V VI VII VIII IX)
    echo "Romano: ${M[m]}${C[c]}${D[d]}${U[u]}"
}

b2d() {
    read -p "Binario: " b
    echo "Decimal: $(echo "ibase=2; $b" | bc)"
}

r2d() {
    read -p "Romano (ej: XIV): " r
    r=${r^^}
    if ! [[ "$r" =~ ^[IVXLCDM]+$ ]]; then
        echo "Error: Solo se permiten caracteres romanos (I, V, X, L, C, D, M)."
        return
    fi
    declare -A val=([I]=1 [V]=5 [X]=10 [L]=50 [C]=100 [D]=500 [M]=1000)
    d=0; p=0
    for ((i=${#r}-1; i>=0; i--)); do
        a=${val[${r:i:1}]}
        [ "$a" -lt "$p" ] && d=$((d - a)) || d=$((d + a))
        p=$a
    done
    echo "Decimal: $d"
    echo "Binario: $(echo "obase=2; $d" | bc)"
}

echo "1. Decimal > Binario"
echo "2. Decimal > Romano"
echo "3. Binario > Decimal"
echo "4. Romano > Decimal y Binario"
read -p "Opción (1/2/3/4): " op
case $op in
    1) d2b ;;
    2) d2r ;;
    3) b2d ;;
    4) r2d ;;
    *) echo "Opción no válida." ;;
esac
