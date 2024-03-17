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
sudo apt install curl git unzip wget -y

echo " "
echo "***********************"
echo "* Instalamos Composer *"
echo "***********************"
echo " "
sleep 3
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar
sudo chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo " "
echo "***********************"
echo "* Instalamos Apache2 *"
echo "***********************"
echo " "
sleep 3
sudo apt install apache2
sudo systemctl status apache2

echo " "
echo "**********************"
echo "* Instalamos PHP 8.2 *"
echo "**********************"
echo " "
sleep 3
sudo apt install php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-curl php8.2-dom -y
php -v

echo " "
echo "**********************"
echo "* Instalamos mysql *"
echo "**********************"
echo " "
sleep 3
sudo apt install mysql-server -y
sudo systemctl start mysql.service

echo " "
echo "*********************"
echo "* instalamos nodejs *"
echo "*********************"
echo " "
sleep 3
#instalamos node js
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo " "
echo "**********************************************"
echo "* agregamos instalador de laravel a composer *"
echo "**********************************************"
echo " "
sleep 3
#configuramos composer para laravel
composer global require laravel/installer --update-with-all-dependencies


