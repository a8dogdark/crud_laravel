#!/bin/bash



#validamos si es usuario root
if [[ $EUID -ne 0 ]]; then
	zenity --error\
	--title="INSTALADOR LARAVEL 11 BY DOGDARK 2024"\
	--text="No eres usuario <b>root</b>\nIngresa con sudo su"\
	--width=500\
	--height=200
	exit 1
fi


#damos la bienvenida al instalador
zenity --question\
	--title="INSTALADOR LARAVEL 11 BY DOGDARK 2024"\
	--text "Bienvenido al Instalador de Laravel 11\nCon paquetes adicionales"\
	--ok-label="Siguiente"\
	--cancel-label="Cancelar"\
	--width=500\
	--height=200
ans=$?
if [ $ans -eq 0 ];then
	echo " "
else
	echo "Has Cancelado la Instalacion"
	exit 1
fi

contenido=$(zenity --list\
	--title="INSTALADOR LARAVEL 11 BY DOGDARK 2024"\
	--width=500\
	--height=500\
	--ok-label="Continuar"\
	--cancel-label="Cancelar"\
	--text="Selecciona los paquetes a instalar"\
	--checklist\
	--column="#" --column="Orden" --column="Paquete"\
	1 "1" "Apache2" 2 "2" "PHP 8.3" 3 "3" "Mysql" 4 "4" "Composer" 5 "5" "Laravel 11" 6 "6" "Proyecto Crud" 7 "7" "Visual Studio Code"
)

muestro=${contenido//|/} #eliminamos los caracteres |

cantidad=${#muestro} #cantidad de caracteres en el array

posa=0
posb=1


for (( i = 0; i < $cantidad; i++ ))
do
	if [ $i = 0 ]; then
		echo "0"
		echo "#Actualizamos el sistema"
		apt update -y &> /dev/null
		
		sleep 1
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "1" ]; then
		echo "10" 
		echo "#Instalando apache2"
		apt install apache2 -y &> /dev/null
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "2" ]; then
		echo "20"
		echo "#Agregando repositorio PHP 8.3"
		#/etc/apt/sources.list
		#echo " " >> /etc/apt/sources.list
		#echo "# repositorio de php" >> /etc/apt/sources.list
		#echo " " >> /etc/apt/sources.list
		#echo "" >> /etc/apt/sources.list
		sudo sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
		echo "23"
		echo "#Actualizamos el sistema"
		apt update -y &> /dev/null
		
		echo "26"
		echo "#Instalando PHP 8.3"
		
		
		
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "3" ]; then
		echo "30"
		echo "#Instalando MYSQL"
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "4" ]; then
		echo "40"
		echo "#Instalando COMPOSER"
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "5" ]; then
		echo "50"
		echo "#Instalando LARAVEL 11"
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "6" ]; then
		echo "60"
		echo "#Instalando PROYECTO CRUD"
		sleep 2
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "7" ]; then
		echo "70"
		echo "#Instalando VISUAL STUDIO CODE"
		sleep 2
	fi
	
	if [ $posa == 0 ] || [ $posb == 1 ];then
		posb=0
	fi
	
	posa=$(( $posa+1 ))
 	posb=$(( $posb+1 ))
 	
done|zenity --progress\
	--title="INSTALADOR LARAVEL 11 BY DOGDARK 2024"\
	--width=500\
	--height=200\
	--percentage=0\
	--auto-close
	