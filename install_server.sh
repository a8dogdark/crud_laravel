#!/bin/sh

pwd="$PWD"

if [ -f "$pwd/slib.sh" ]; then
    chmod +x "$pwd/slib.sh"
    # shellcheck disable=SC1091
    . "$pwd/slib.sh"
  # Download the slib (source: http://github.com/virtualmin/slib)
else
    wget "https://raw.githubusercontent.com/a8dogdark/crud_laravel/main/slib.sh"
    chmod +x slib.sh
    # shellcheck disable=SC1091
    . ./slib.sh
fi

clear

printf "${CYAN}"
printf "***************************************************"
printf "* Bienvenido al instalador de paquetes de dogdark *"
printf "* Instalación de                                  *"
printf "* Servidor Xampp                                  *"
printf "* Apache - PHP 8.2 - Mysql                        *"
printf "***************************************************"
sleep 5
printf "${GREEN} "
run_ok "sudo apt update -y" "Actualizando el sistema"

exit 1