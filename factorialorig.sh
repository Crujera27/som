loop=$1 
loopsave=$loop

factorial=1
while [ $loop -gt 0 ]
do
   factorial=$(( $factorial * $loop ))
   loop=$(( $loop - 1 ))
done

echo "El factorial de $loopsave es $factorial"
