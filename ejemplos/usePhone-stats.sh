#!/bin/bash


#aqui debe ir:
#promedio de uso los telefonos
#max y min para el tiempo usado (creo)

forma_uso(){
	echo "Uso adecuado $0 -f <directorio de datos> [-h]"
#	echo "-d: directorio donde están los datos a procesar."
#	echo "-h: muestra este mensaje y termina"
	exit 1
}

while getopts "f:h" opcion; do
	case "$opcion" in
		f)
			dataIn=$OPTARG
			;;
		h)
			forma_uso
			;;
		*)
			forma_uso
			;;
	esac
done

if [ -z "dataIn" ]; then
	forma_uso
fi

BASEDIR=$(readlink -f $0)
BASEDIR=$(dirname $BASEDIR)

dataIn="$BASEDIR/$dataIn"

if [ ! -e $dataIn ]; then
	echo "dataIn no existe"
	exit 1
fi

content=$(cat $dataIn)


suma=0
promedio=0
count=-1
for linea in $content; do
	count=$(expr $count + 1)
	numExperiment=$(echo $linea | cut -d ':' -f 1)
	timeStamp=$(echo $linea | cut -d ':' -f 2)
	usePhone=$(echo $linea | cut -d ':' -f 3)

	suma=$(expr $suma + $usePhone)

#	$printf "numExperiment: $numExperiment, timeStamp: $timeStamp, usePhone: $usePhone\n"
done

printf "$suma\n"
#printf "$promedio\n"

