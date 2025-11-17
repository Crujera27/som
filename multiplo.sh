echo "Número pequeño"
read -p small
echo "Número grande"
read -p grande


if [[ $small -le $grande ]];
 then
	echo " $grande es multiplo de $small "
 else
	echo " $grande NO es multiplo de $small "

fi

exit 0
