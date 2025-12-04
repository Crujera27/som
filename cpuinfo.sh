#!/bin/bash

maxfreq=$(grep "cpu MHz" /proc/cpuinfo | head -1 | awk '{print $4}')

while [[ true ]]; do
    clear
    echo "=== CPU INFO ==="
    echo ""
    grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2
    echo ""
    echo "Max: $maxfreq MHz"
    echo ""
    echo "=== NUCLEOS ==="
    echo ""
    
    contador=0
    grep "cpu MHz" /proc/cpuinfo | while read line; do
        freqactual=$(echo $line | awk '{print $4}')
        porcentaje=$(echo "scale=2; ($freqactual / $maxfreq) * 100" | bc)
        echo "Core $contador: $freqactual MHz -> $porcentaje%"
        contador=$(($contador+1))
    done
    
    sleep 1
done

exit 0
