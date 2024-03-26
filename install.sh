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
	1 "1" "Apache2" 2 "2" "PHP 8.3" 3 "3" "Mysql" 4 "4" "Composer" 5 "5" "Laravel 11" 6 "6" "NodeJS" 7 "7" "Proyecto Crud" 8 "8" "Visual Studio Code"
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
		sleep 1
		apt update -y &> /dev/null
		

		echo "4"
		echo "#Actualizamos las listas"
		sleep 1
		apt list --upgradable -y &> /dev/null

		echo "8"
		echo "#Upgradamos el sistema"
		sleep 1
		apt upgrade -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "1" ]; then
		echo "10" 
		echo "#Instalando apache2"
		sleep 1
		apt install apache2 -y &> /dev/null

		echo "15"
		echo "#Configurando apache2"
		sleep 1
		chmod 777 -R /var/www/html
		rm /var/www/html/index.html
		touch /var/www/html/index.html
		echo '<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Laravel 11 By Dogdark</title></head><body><h1>Instalador de Laravel 11 By dogdark</h1></body></html>'	>> /var/www/html/index.html
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "2" ]; then
		echo "20"
		echo "#Agregando repositorio PHP 8.3"
		sleep 1
		sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
		
		echo "22"
		echo "#Actualizamos el sistema"
		sleep 1
		apt update -y &> /dev/null

		echo "24"
		echo "#Instalamos dependencias requeridas para PHP8.3"
		sleep 1
		apt install lsb-release ca-certificates apt-transport-https software-properties-common curl git unzip -y &> /dev/null

		echo "26"
		echo "#Instalando PHP 8.3"
		sleep 1
		apt install php8.3 -y &> /dev/null

		echo "27"
		echo "#Instalando PHP 8.3-cli"
		sleep 1
		apt install php8.3-cli -y &> /dev/null
		
		echo "28"
		echo "#Instalando PHP 8.3-xml"
		sleep 1
		apt install php8.3-xml -y &> /dev/null

		echo "29"
		echo "#Instalando PHP 8.3-curl"
		sleep 1
		apt install php8.3-curl -y &> /dev/null

		echo "29"
		echo "#Instalando PHP 8.3-dom"
		sleep 1
		apt install php8.3-dom -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "3" ]; then
		echo "30"
		echo "#Instalando MYSQL"
		sleep 1
		apt install mysql-server -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "4" ]; then
		echo "40"
		echo "#Instalando COMPOSER"
		sleep 2
		#apt install php8.3-dom -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "5" ]; then
		echo "50"
		echo "#Instalando LARAVEL 11"
		sleep 2
		#apt install php8.3-dom -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "6" ]; then
		echo "60"
		echo "#Instalando NODEJS"
		sleep 2
		#apt install php8.3-dom -y &> /dev/null
	fi
	
	if [ ${muestro[@]:$posa:$posb} == "7" ]; then
		echo "70"
		echo "#Instalando PROYECTO CRUD"
		sleep 2
		#apt install php8.3-dom -y &> /dev/null
	fi

	if [ ${muestro[@]:$posa:$posb} == "8" ]; then
		echo "80"
		echo "#Instalando VISUAL STUDIO CODE"
		sleep 2
		#apt install php8.3-dom -y &> /dev/null
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

zenity --info\
	--title="INSTALADOR LARAVEL 11 BY DOGDARK 2024"\
	--width=500\
	--height=200\
	--text="FIN INSTALACIÓN"