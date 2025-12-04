#!/bin/bash

fibonacci() {
    a=0
    b=1
    lastsec=$(date +%S)

    while true; do
        c=$(echo "$a + $b" | bc)
        a=$b
        b=$c
        
        secactual=$(date +%S)
        secactual=$((10#$secactual))
        
        if [ $((secactual % 5)) -eq 0 ] && [ "$secactual" != "$lastsec" ]; then
            echo "Seg: $secactual - Fib: $c"
            lastsec=$secactual
        fi
    done
}

if [ ! -f nveces.dat ]; then
    echo "Error: El archivo nveces.dat no existe"
    exit 1
fi

nveces=$(cat nveces.dat)

if [ -z "$nveces" ]; then
    echo "Error: nveces.dat está vacío"
    exit 1
fi

ncpus=$(nproc)
max_permitido=$((ncpus * 2))

if [ $nveces -gt $max_permitido ]; then
    echo "Error: nveces ($nveces) excede el máximo ($max_permitido)"
    exit 1
fi

for i in $(seq 1 $nveces); do
    fibonacci &
done

wait

exit 0
