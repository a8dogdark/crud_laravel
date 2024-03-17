#!/bin/sh
clear

echo "******************************"
echo "* agregamos php 8 al sistema *"
echo "******************************"
sleep 3
sudo add-apt-repository ppa:ondrej/php

echo "***************************"
echo "* actualizamos el sistema *"
echo "***************************"
sleep 3
#actualizamos el sistema
sudo apt update -y

echo "*************************************"
echo "* agregamos los paquetes requeridos *"
echo "*************************************"
sleep 3
#agregamos las dependencias requeridas
sudo apt install curl php8.2-cli php8.2-mbstring git unzip wget -y

echo "*********************"
echo "* descargamos xampp *"
echo "*********************"
sleep 3
#descargamos xampp desde su web oficial
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run

echo "************************"
echo "* descargamos composer *"
echo "************************"
sleep 3
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar

echo "*****************************************"
echo "* cambiamos permisos a xampp y composer *"
echo "*****************************************"
sleep 3
# cambiamos los permisos a los archivos
sudo chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo chmod +x composer.phar

echo "********************"
echo "* movemos composer *"
echo "********************"
sleep 3
# movemos composer
sudo mv composer.phar /usr/local/bin/composer

echo "********************************"
echo "* agregamos composer al bashrc *"
echo "********************************"
sleep 3
#agregamos composer al path
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo "**********************"
echo "* activamos composer *"
echo "**********************"
sleep 3
sudo -s source ~/.bashrc

echo "********************"
echo "* instalamos xampp *"
echo "********************"
sleep 3
#instalamos xampp
sudo ./xampp-linux-x64-8.2.12-0-installer.run

echo "*******************"
echo "* detenemos xampp *"
echo "*******************"
sleep 3
#detenemos el servidor
sudo /opt/lampp/lampp stop

echo "***************************************"
echo "* creamos enlaces simbolicos de mysql *"
echo "***************************************"
sleep 3
#creamos los enlaces simbolicos
sudo ln -s /opt/lampp/bin/mysql /usr/bin

echo "*********************"
echo "* instalamos nodejs *"
echo "*********************"
sleep 3
#instalamos node js
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "**********************************************"
echo "* agregamos instalador de laravel a composer *"
echo "**********************************************"
sleep 3
#configuramos composer para laravel
composer global require laravel/installer

echo "*****************************************"
echo "* eliminamos la carpeta htdocs de xampp *"
echo "*****************************************"
sleep 3
#eliminamos los archivos de la carpeta htdocs
sudo rm -R /opt/lampp/htdocs

echo "*************************************************"
echo "* creamos la carpeta htdocs de xampp nuevamente *"
echo "*************************************************"
sleep 3
#creamos la carpeta htdocs nuevamente
sudo mkdir /opt/lampp/htdocs

echo "*****************************************************"
echo "* cambiamos permisos de escritura a htdocs de xampp *"
echo "*****************************************************"
sleep 3

#cambiamos los permisos de la carpeta htdocs de xampp
sudo chmod 777 -R /opt/lampp/htdocs

echo "*************************************"
echo "* nos movemos a la carpeta a htdocs *"
echo "*************************************"
sleep 3
#nos movemos a la carpeta htdocs
cd /opt/lampp/htdocs

#creamos el nuevo proyecto
echo "*************************************"
echo "* creamos el nuevo proyecto de crud *"
echo "*************************************"
sleep 3
laravel new crud

echo "*********************************************"
echo "* cambiamos los permisos de la carpeta crud *"
echo "*********************************************"

sudo chmod 777 -R /opt/lampp/htdocs/crud




echo "fin instalacion"

exit
