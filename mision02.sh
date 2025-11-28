#!/bin/bash

echo "Minutos,Carga" > cpumme.csv

inicio=$(date +%s)

while [[ true ]]; do
    actual=$(date +%s)
    minutos=$(( (actual - inicio) / 60 ))
    
    carga=$(cat /proc/loadavg | cut -d' ' -f1)
    
    echo "$minutos,$carga" >> cpumme.csv
    
    sleep 60
done

exit 0