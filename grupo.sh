#!/bin/bash

var=${1:?"Se necesita un grupo"}

var=$(egrep "^$var" /etc/group) 

if [[ $var ]]; then
    echo -e "Exite el grupo: $1 \n:D"
else 
    echo -e "No existe el grupo: $1\n:("
fi

