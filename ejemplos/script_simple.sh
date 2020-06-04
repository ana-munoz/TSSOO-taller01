#!/bin/bash


#RUTA ABSOLUTA
BASEDIR=$(readlink -f $0)
BASEDIR=$(dirname $BASEDIR)


dataIn="$BASEDIR/datos.txt"

#si el archivo no existe, entonces dice por pantalla que no pasa nah

if [ ! -e $dataIn ]; then
        echo "dataIn no existe."
        exit 1
fi

#contenido concatena dataIn
contenido=$(cat $dataIn)

#este for recorre el archivo y va separando datos (o campos).
#guarda en una variable cada uno de los campos que lee por linea
#luego, muestra por pantalla con el formato "nombre: edad, estado"
for linea in $contenido; do
        nombre=$(echo $linea | cut -d ':' -f 1)
        edad=$(echo $linea | cut -d ':' -f 2)
        estado=$(echo $linea | cut -d ':' -f 3)

        printf "$nombre: $edad, $estado\n"
done
