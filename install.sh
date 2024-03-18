#!/bin/bash

#validamos si existe o no el paquete de zenity
if ! [ -f "/usr/bin/zenity" ]; then 
    sudo apt install zenity -y
fi

if [[ $EUID -ne 0  ]]; then
    zenity --error \
    --text="Debes ser Usuario Root\nIngresa con sudo su"\
    --width=500
    exit 1
fi

zenity --info \
    --text="\n\n\nINSTALADOR DE LARAVEL CON LAMPP\n\nBy Dogdark 2024"\
    --width=500\
    --height=300