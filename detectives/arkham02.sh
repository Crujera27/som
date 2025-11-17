#!/bin/bash

mkdir -p $HOME/Arkham/Hangares/{Terrar,Profur,Medea}

min=$(date +"%M")

echo " Minuto actual:  $min " 

reset(){
	rm $HOME/Arkham/Hangares/Habilitado > /dev/null
}
hab(){
	ln -s $HOME/Arkham/Hangares/$1 $HOME/Arkham/Hangares/Habilitado

}

terrar(){

	reset
	hab "Terrar"
}

profur(){
	
	reset
	hab "Profur"
}

medea(){

	reset
	hab "Medea"

}

if [ $min -le 4 ]; then
	terrar
elif [ $min -le 9 ]; then
	profur
elif [ $min -le 14 ]; then
	medea
elif [ $min -le 19 ]; then
	terrar
elif [ $min -le 24 ]; then 
	profur
elif [ $min -le 29 ]; then
	medea
elif [ $min -le 34 ]; then
	terrar
elif [ $min -le 39 ]; then
	profur
elif [ $min -le 44]; then
	medea
elif [ $min -le 49]; then
	terrar
elif [ $min -le 54 ]; then
	profur
elif [ $min -le 59 ]; then
	medea
fi

ls -la $HOME/Arkham/Hangares/Habilitado



exit 0
