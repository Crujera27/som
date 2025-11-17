num=$1
output=0

for ((i = 2; i <= $(($num/2)); ++i)); do
	if [ $(($num % $i)) -eq 0 ]; then
      		output=1
      		break
    	fi
done

if [ $output -eq 0 ]; then
	echo "$num es primo"
else
	echo "$num NO es primo"
fi
