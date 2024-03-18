#!/bin/bash
ans=$?
#validamos si existe o no el paquete de zenity
if ! [ -f "/usr/bin/zenity" ]; then 
    sudo apt install zenity -y
fi

if [[ $EUID -ne 0  ]]; then
    zenity --error \
    --title="!!!ALERTA!!!"\
    --text="Debes ser Usuario Root\nIngresa con sudo su"\
    --width=500
    exit 1
fi

zenity --info \
    --title="Instalador"\
    --text="\n\n\nINSTALADOR DE LARAVEL CON LAMPP\n\nBy Dogdark 2024"\
    --width=500\
    --height=300\
    --ok-label="Continuar"

zenity --question \
    --title="Instalador"\
    --text="Se instalarán los siguientes paquetes.\n- Apache2\n- PHP 8.2\n- Mysql\n- Composer\n- Laravel\n- Nodejs\n- Proyecto crud."\
    --width=500\
    --height=300\
    --ok-label="Continuar"\
    --cancel-label="Cancelar"
if [ $ans -eq 0 ]; then
    echo "sigamos"
else
    echo "terminamos"
fi
