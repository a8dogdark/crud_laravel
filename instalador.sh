#!/bin/sh
#actualizamos el sistema
sudo apt update -y
#agregamos las dependencias requeridas
sudo apt install curl php-cli php-mbstring git unzip wget -y
#descargamos xampp desde su web oficial
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run
#descargamos composer
wget https://getcomposer.org/download/2.7.2/composer.phar
# cambiamos los permisos a los archivos
sudo chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo chmod +x composer.phar
# movemos composer
sudo mv composer.phar /usr/local/bin/composer
#agregamos composer al path
echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
