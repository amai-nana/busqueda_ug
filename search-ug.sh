#!/bin/bash

## search-ug.sh --- Verificación de existencia de grupo o usuario
#
# Filename: search-ug.sh
# Description: Verificación de existencia de grupo o usuario
# Author: Tania Marin (nana)
# Version: 0.1
# Status: Develop
#
# This program is free software# you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation either version 3, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY# without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program# see the file COPYING. If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth
# Floor, Boston, MA 02110-1301, USA.
#
######################################################################
#
## Code:

# IFS=' \n\t'

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
