 #!/bin/bash
echo "Script Punto E"
DIR=~/repogit/UTNFRA_SO_1P2C_2024_Farina/RTA_ARCHIVOS_Examen_20241003
grep MemTotal /proc/meminfo > RTA_ARCHIVOS_Examen_20241003/Filtro_basico.txt
sudo dmidecode -t chassis | grep -i 'manufacturer'>> RTA_ARCHIVOS_Examen_20241003/Filtro_basico.txt 
