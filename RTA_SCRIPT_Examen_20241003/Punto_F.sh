#!/bin/bash
echo "Script Punto F"
DIR=/home/osboxes/repogit/UTNFRA_SO_1P2C_2024_Farina/RTA_ARCHIVOS_Examen_20241003
echo "Mi ip publica es: $(curl -s ifconfig.me)" > "$DIR/Filtro_Avanzado.txt"
echo "Mi usuario es: $(whoami)" >> "$DIR/Filtro_Avanzado.txt"
echo "El hash de mi usuario es: $(sudo grep "^$(whoami):" /etc/shadow | awk -F: '{print $2}')" >> "$DIR/Filtro_Avanzado.txt"
echo "La URL de mi repositorio es: $(git config --get remote.origin.url)" >> "$DIR/Filtro_Avanzado.txt"
