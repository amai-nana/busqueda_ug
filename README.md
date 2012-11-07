# Busqueda de usuarios y grupos

## Motivacion

Hacer un programa que permita la busqueda de un usuario o un 
grupo.

## Referencia

Es un script en bash que utiliza getopts para reconocer las opciones
de busqueda, la sintaxis es la siguiente:

'''sh 
search_ug.sh opciones_busqueda referencia
'''

* opciones_busqueda - modalidades de busqueda
    * -u busca unicamente usuarios
    * -g busca unicamente grupos
    * -a busca usuarios y grupos

* referencia - es el nombre del usuario o del grupo, en el caso de la opcion -a
  se tiene que dar tanto nombre de usuario y grupo.
