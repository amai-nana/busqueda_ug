#!/bin/bash

var=${1:?"Se requieren parametros"}

while getopts ":u:g:a" var; do
    case $var in
        u) 
            archivo="/etc/passwd"
            var=$(egrep "^$OPTARG" ${archivo})
            if [[ $var ]]; then
                echo -e "Exite el usuario: $OPTARG en el sistema\n"
            else
                echo -e "El usuario $OPTARG no existe en el sistema\n"
            fi
            ;;
        g) 
            archivo="/etc/group"
            var=$(egrep "^$OPTARG" ${archivo})
            if [[ $var ]]; then
                echo -e "Existe el grupo: $OPTARG en el sistema\n"
            else
                echo -e "El usuario $OPTARG no existe en el sistema\n"
            fi
            ;;

        a)
            shift
            usuario="/etc/passwd"
            grupo="/etc/group"
            var1=$(egrep "^$1" ${usuario})
            var2=$(egrep "^$2" ${grupo})
            if [[ $var1 && $var2 ]]; then
                echo -e "El usuario $1 exixte\n El grupo $2 existe\n"
            else if [[ !$var1 && $var2 ]]; then
                    echo -e "El usuario $1 no existe\nEl grupo $2 si existe\n"
                 else if [[ $var1 && !$var2 ]]; then
                        echo -e "El usuario $1 si existe\n El grupo $2 no existe\n"
                     else if [[ !$var1 && !$var2 ]]; then
                            echo -e "El usuario $1 y el grupo $2 no existen\n"
                          fi
                     fi
                 fi
            fi
            ;;
        \?)
            echo -e "Error de sintaxis\n"
            echo "Sintaxis"
            echo "$0 [-u | -g | -a] [ARGUMENTOS]"
            echo "-u para buscar usuario"
            echo "-g para buscar un grupo"
            echo "-a para buscar un usuario y grupo"
            ;;
        :)
            echo "Se requieren argumentos";;

    esac
done
