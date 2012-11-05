#!/bin/bash

var=${1:?"Se necesitan parametros"}

busqueda=${2:-"usuario"}

if [[ $busqueda == "usuario" ]]; then 
    archivo="/etc/passwd"
else
    archivo="/etc/group"
fi

var=$(egrep "^$var" ${archivo}) 

if [[ $var ]]; then
    echo -e "Exite : $busqueda: $1 \n:D"
else 
    echo -e "No existe $busqueda: $1 \n:("
fi

