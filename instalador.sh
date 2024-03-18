#!/bin/bash
clear

cd ~/Descargas
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
sudo apt install curl php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-curl php8.2-dom git unzip wget -y

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
#<<<<<<< HEAD
#echo "inicio"
#sleep 3
#=======
#echo "inicio" >> ~/.bashrc
#>>>>>>> 38a9aa912ccb7cf5cad37e380343798b5d835268
#echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
#echo 'echo $PATH' >> ~/.bashrc
#echo "fin" >> ~/.bashrc


echo "**********************"
echo "* activamos composer *"
echo "**********************"
sleep 3
source ~/.bashrc
echo "fin"
sleep 3

echo " "
echo "********************"
echo "* instalamos xampp *"
echo "********************"
echo " "
sleep 3
#instalamos xampp
sudo ./xampp-linux-x64-8.2.12-0-installer.run

echo "*************************************"
echo "* eliminamos el instalador de xampp *"
echo "*************************************"
sleep 3
sudo rm xampp-linux-x64-8.2.12-0-installer.run

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
composer global require laravel/installer --update-with-all-dependencies

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
#laravel new crud
composer create-project laravel/laravel crud

echo "*********************************************"
echo "* cambiamos los permisos de la carpeta crud *"
echo "*********************************************"
sleep 3
sudo chmod 777 -R /opt/lampp/htdocs/crud

echo "*********************************************************"
echo "* creamos el servidor virtual para el dominio crud.test *"
echo "*********************************************************"
sleep 3
sudo chmod 777 /etc/hosts

sudo echo '127.0.0.1  crud.test' >> /etc/hosts

sudo chmod 644 /etc/hosts

#activamos el uso de host virtuales en xampp
echo "***********************************************"
echo "* activamos el uso de host virtuales en xampp *"
echo "***********************************************"
sleep 3

sudo chmod 777 /opt/lampp/etc/httpd.conf

sudo echo 'Include etc/extra/httpd-vhost.conf' >> /opt/lampp/etc/httpd.conf

sudo chmod 644 /opt/lampp/etc/httpd.conf


echo "**********************************************"
echo "* ahora debemos dar de alta el nuevo dominio *"
echo "**********************************************"
sleep 3

sudo chmod 777 /opt/lampp/etc/extra/httpd-vhosts.conf

sudo echo '<VirtualHost *:80>' >> /opt/lampp/etc/extra/httpd-vhosts.conf
sudo echo 'DocumentRoot "/opt/lampp/htdocs/crud/public"' >> /opt/lampp/etc/extra/httpd-vhosts.conf
sudo echo 'ServerName crud.test' >> /opt/lampp/etc/extra/httpd-vhosts.conf
sudo echo 'ServerAlias www.crud.test' >> /opt/lampp/etc/extra/httpd-vhosts.conf
sudo echo '</VirtualHost>' >> /opt/lampp/etc/extra/httpd-vhosts.conf

sudo chmod 644 /opt/lampp/etc/extra/httpd-vhosts.conf

echo "*******************************"
echo "* iniciamos el servidor xampp *"
echo "*******************************"
sleep 3
sudo /opt/lampp/lampp start

echo "*********************************"
echo "* instalamos visual studio code *"
echo "*********************************"
sleep 3
sudo snap install --classic code

xdg-open http://crud.test

echo "fin instalacion"

exit
