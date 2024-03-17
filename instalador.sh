#!/bin/sh
clear
echo "actualizamos el sistema"
sleep 1
#actualizamos el sistema
sudo apt update -y

echo "agregamos los paquetes requeridos"
sleep 1
#agregamos las dependencias requeridas
sudo apt install curl php-cli php-mbstring git unzip wget -y

echo "descargamos xampp"
sleep 1
#descargamos xampp desde su web oficial
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run

echo "descargamos composer"
sleep 1
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar

echo "cambiamos permisos a xampp y composer"
sleep 1
# cambiamos los permisos a los archivos
sudo chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo chmod +x composer.phar

echo "movemos composer"
sleep 1
# movemos composer
sudo mv composer.phar /usr/local/bin/composer

echo "agregamos composer al bashrc"
sleep 1
#agregamos composer al path
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo "activamos composer"
sleep 1
source ~/.bashrc

echo "instalamos xampp"
sleep 1
#instalamos xampp
sudo ./xampp-linux-x64-8.2.12-0-installer.run

echo "detenemos xampp"
sleep 1
#detenemos el servidor
sudo /opt/lampp/lampp stop

echo "creamos enlaces simbolicos de xampp"
sleep 1
#creamos los enlaces simbolicos
sudo ln -s /opt/lampp/bin/php /usr/bin
sudo ln -s /opt/lampp/bin/mysql /usr/bin

echo "instalamos nodejs"
sleep 1
#instalamos node js
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "agregamos instalador de laravel a composer"
sleep 1
#configuramos composer para laravel
composer global require laravel/installer

echo "eliminamos la carpeta htdocs de xampp"
sleep 1
#eliminamos los archivos de la carpeta htdocs
sudo rm -R /opt/lampp/htdocs

echo "creamos la carpeta htdocs de xampp nuevamente"
sleep 1
#creamos la carpeta htdocs nuevamente
sudo mkdir /opt/lampp/htdocs

echo "cambiamos permisos de escritura a htdocs de xampp"
sleep 1
#cambiamos los permisos de la carpeta htdocs de xampp
sudo chmod 777 -R /opt/lampp/htdocs

#nos movemos a la carpeta htdocs
cd /opt/lampp/htdocs
