#!/bin/sh
clear
print "actualizamos el sistema\n"
sleep 1
#actualizamos el sistema
sudo apt update -y

print "agregamos los paquetes requeridos\n"
sleep 1
#agregamos las dependencias requeridas
sudo apt install curl php-cli php-mbstring git unzip wget -y

print "descargamos xampp\n"
sleep 1
#descargamos xampp desde su web oficial
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run

print "descargamos composer\n"
sleep 1
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar

print "cambiamos permisos a xampp y composer\n"
sleep 1
# cambiamos los permisos a los archivos
sudo chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo chmod +x composer.phar

print "movemos composer\n"
sleep 1
# movemos composer
sudo mv composer.phar /usr/local/bin/composer

print "agregamos composer al bashrc\n"
sleep 1
#agregamos composer al path
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

print "activamos composer\n"
sleep 1
source ~/.bashrc

print "instalamos xampp\n"
sleep 1
#instalamos xampp
sudo ./xampp-linux-x64-8.2.12-0-installer.run

print "detenemos xampp\n"
sleep 1
#detenemos el servidor
sudo /opt/lampp/lampp stop

print "creamos enlaces simbolicos de xampp\n"
sleep 1
#creamos los enlaces simbolicos
sudo ln -s /opt/lampp/bin/php /usr/bin
sudo ln -s /opt/lampp/bin/mysql /usr/bin

print "instalamos nodejs\n"
sleep 1
#instalamos node js
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

print "agregamos instalador de laravel a composer\n"
sleep 1
#configuramos composer para laravel
composer global require laravel/installer

print "eliminamos la carpeta htdocs de xampp\n"
sleep 1
#eliminamos los archivos de la carpeta htdocs
sudo rm -R /opt/lampp/htdocs

print "creamos la carpeta htdocs de xampp nuevamente\n"
sleep 1
#creamos la carpeta htdocs nuevamente
sudo mkdir /opt/lampp/htdocs

print "cambiamos permisos de escritura a htdocs de xampp\n"
sleep 1
#cambiamos los permisos de la carpeta htdocs de xampp
sudo chmod 777 -R /opt/lampp/htdocs

#nos movemos a la carpeta htdocs
cd /opt/lampp/htdocs
