#!/bin/bash
clear

cd ~/Descargas
echo "******************************"
echo "* agregamos php 8 al sistema *"
echo "******************************"
sleep 3
sudo add-apt-repository ppa:ondrej/php

echo " "
echo "***************************"
echo "* actualizamos el sistema *"
echo "***************************"
echo " "
sleep 3
#actualizamos el sistema
sudo apt update -y

echo " "
echo "*************************************"
echo "* agregamos los paquetes requeridos *"
echo "*************************************"
echo " "
sleep 3
#agregamos las dependencias requeridas
sudo apt install curl php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-curl php8.2-dom git unzip wget -y

echo " "
echo "************************"
echo "* descargamos composer *"
echo "************************"
echo " "
sleep 3
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar

