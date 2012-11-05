#!/bin/bash

var=$(egrep "^$1" /etc/group) 

if [[ $var ]]; then
    echo "Exite el grupo: "$1
else 
    echo "No existe el grupo: "$1
fi

