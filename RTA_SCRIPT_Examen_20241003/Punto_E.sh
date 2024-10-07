 #!/bin/bash
echo "Script Punto E"
DIR=~/repogit/UTNFRA_SO_1P2C_2024_Farina/RTA_ARCHIVOS_Examen_20241003
grep MemTotal /proc/meminfo > "$DIR/Filtro_Basico.txt"
sudo dmidecode -t chassis | grep 'Manufacturer' | awk -F: '{print $1, $2}' >> "$DIR/Filtro_Basico.txt"

