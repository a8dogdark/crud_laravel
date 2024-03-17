#!/bin/sh
clear
echo "agregamos php 8 al sistema"
sleep 3
sudo add-apt-repository ppa:ondrej/php

echo "actualizamos el sistema"
sleep 3
#actualizamos el sistema
sudo apt update -y

echo "agregamos los paquetes requeridos"
sleep 3
#agregamos las dependencias requeridas
sudo apt install curl php8.2-cli php8.2-mbstring git unzip wget -y

echo "descargamos xampp"
sleep 3
#descargamos xampp desde su web oficial
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run

echo "descargamos composer"
sleep 3
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar

echo "cambiamos permisos a xampp y composer"
sleep 3
# cambiamos los permisos a los archivos
sudo chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo chmod +x composer.phar

echo "movemos composer"
sleep 3
# movemos composer
sudo mv composer.phar /usr/local/bin/composer

echo "agregamos composer al bashrc"
sleep 3
#agregamos composer al path
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo "activamos composer"
sleep 3
sudo -s source ~/.bashrc

echo "instalamos xampp"
sleep 3
#instalamos xampp
sudo ./xampp-linux-x64-8.2.12-0-installer.run

echo "detenemos xampp"
sleep 3
#detenemos el servidor
sudo /opt/lampp/lampp stop

echo "creamos enlaces simbolicos de xampp"
sleep 3
#creamos los enlaces simbolicos
sudo ln -s /opt/lampp/bin/mysql /usr/bin

echo "instalamos nodejs"
sleep 3
#instalamos node js
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "agregamos instalador de laravel a composer"
sleep 3
#configuramos composer para laravel
composer global require laravel/installer

echo "eliminamos la carpeta htdocs de xampp"
sleep 3
#eliminamos los archivos de la carpeta htdocs
sudo rm -R /opt/lampp/htdocs

echo "creamos la carpeta htdocs de xampp nuevamente"
sleep 3
#creamos la carpeta htdocs nuevamente
sudo mkdir /opt/lampp/htdocs

echo "cambiamos permisos de escritura a htdocs de xampp"
sleep 3


echo "fin instalacion"

exit
#cambiamos los permisos de la carpeta htdocs de xampp
sudo chmod 777 -R /opt/lampp/htdocs

#nos movemos a la carpeta htdocs
cd /opt/lampp/htdocs
