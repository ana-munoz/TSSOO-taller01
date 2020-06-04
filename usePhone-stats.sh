#!/bin/bash


#aqui debe ir:
#promedio de uso los telefonos
#max y min para el tiempo usado (creo)

forma_uso(){
	echo "Uso adecuado $0 -d <directorio de datos> [-h]"
	echo "-d: directorio donde están los datos a procesar."
	echo "-h: muestra este mensaje y termina"
	exit 1
}

while getopts "d:h" opcion; do
	case "$opcion" in
		d)
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

if [ ! -e $searchDir ]; then
	echo "No existe el directorio"
	exit 1
fi

content=$(`find $searchDir -name '*.txt.' -print | sort |grep usePhone | grep -v '._'`)

for i in ${usePhoneFiles[*]};
do
	printf "> $s\n" $i
	tiempos=(`cat $i | tail -n+3 | cut -d ':' -f 3`)
	for i in ${tiempos[*]};
	do
		printf "%d:" $i >> $tmpFile
	done
	printf "\n" >> $tmpFile
done


#content=$(cat $dataIn)

#for linea in $content; do
#	numExperiment=$(echo $linea | cut -d ':' -f 1)
#	timeStamp=$(echo $linea | cut -d 'd' -f 2)
#	usePhone=$(echo $linea | cut -d ':' -f 3)

#	printf "Experimento numero: $numExperiment, tiempo de la medicion: $timeStamp, qty personas con uso de telefono $usePhone\n"
#	suma=($numExperiment + 1)
#done

#printf "$suma\n"

