#!/bin/bash
echo "Script Punto B"

num_primarias=3
num_logicas7
tam_particion=1

{
	# Particiones primarias
	for ((i=1; i<=num_primarias; i++)); do
       	    echo "n"       
            echo "p"       
            echo "$i"      
            if [ $i -eq 1 ]; then
                echo "" 
            else
                echo "+$tam_particion"G
            fi
        done

	# Particion extendida
    	echo "n"          
    	echo "e"          
    	echo ""           
    	echo "+$((num_logicas * tam_particion))"G
    	
    	for ((i=1; i<=num_logicas; i++)); do
            echo "n"       
            echo "l"      
            echo "$i"     
            echo "+$tam_particion"G 
    	done

        echo "w"        
} | sudo fdisk /dev/sdb

echo "Formatear las particiones con ext4"
for i in {1..3}; do
    sudo mkfs.ext4 /dev/sdb$i
done

for i in {5..11}; do
    sudo mkfs.ext4 /dev/sdb$i
done

echo "Montando las particiones..."
sudo mount /dev/sdb1 /Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdb2 /Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdb3 /Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdb5 /Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdb6 /Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdb7 /Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdb8 /Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdb9 /Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdb10 /Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdb11 /Examenes-UTN/profesores

# Agregar entradas a /etc/fstab para el montaje persistente
{
    echo "/dev/sdb1   /Examenes-UTN/alumno_1/parcial_1   ext4    defaults    0    0"
    echo "/dev/sdb2   /Examenes-UTN/alumno_1/parcial_2   ext4    defaults    0    0"
    echo "/dev/sdb3   /Examenes-UTN/alumno_1/parcial_3   ext4    defaults    0    0"
    echo "/dev/sdb5   /Examenes-UTN/alumno_2/parcial_1   ext4    defaults    0    0"
    echo "/dev/sdb6   /Examenes-UTN/alumno_2/parcial_2   ext4    defaults    0    0"
    echo "/dev/sdb7   /Examenes-UTN/alumno_2/parcial_3   ext4    defaults    0    0"
    echo "/dev/sdb8   /Examenes-UTN/alumno_3/parcial_1   ext4    defaults    0    0"
    echo "/dev/sdb9   /Examenes-UTN/alumno_3/parcial_2   ext4    defaults    0    0"
    echo "/dev/sdb10  /Examenes-UTN/alumno_3/parcial_3   ext4    defaults    0    0"
    echo "/dev/sdb11  /Examenes-UTN/profesores            ext4    defaults    0    0"

} | sudo tee -a /etc/fstab
