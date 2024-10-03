#!/bin/bash
echo "Script Punto B"

config.vm.disk :disk, size "10GB", name: "Disco 10GB"
config.vm.disk :disk, size "10GB", name: "Disco 2GB"

num_primarias=4
num_logicas=6
tam_particion=1

{
	# Crear las particiones primarias
	for ((i=1; i<=num_primarias; i++)); do
       	    echo "n"       # Crear nueva partición
            echo "p"       # Partición primaria
            echo "$i"      # Número de partición
            if [ $i -eq 1 ]; then
                echo ""    # Primer partición, empieza en el primer sector
            else
                echo "+$tam_particion"G # Tamaño de 1GB
            fi
        done

	# Crear una partición extendida
    	echo "n"           # Crear nueva partición
    	echo "e"           # Partición extendida
    	echo ""            # Número de partici�
    	echo "+$((num_logicas * tam_particion))"G # Tamaño total de las lógicas

    	# Crear las particiones lógicas dentro de la extendida
    	for ((i=1; i<=num_logicas; i++)); do
            echo "n"       # Crear nueva partición
            echo "l"       # Partición lógica
            echo ""        # Número de partición
            echo "+$tam_particion"G # Tamaño de 1GB
    	done

        echo "w"        
} | sudo fdisk /dev/sdb

echo "Formatear las particiones con ext4"
for i in {1..4}; do
    sudo mkfs.ext4 /dev/sdb$i
done

for i in {5..10}; do
    sudo mkfs.ext4 /dev/sdb$i
done

echo "Montando las particiones..."
sudo mount /dev/sdb1 /Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdb2 /Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdb3 /Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdb4 /Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdb5 /Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdb6 /Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdb7 /Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdb8 /Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdb9 /Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdb10 /Examenes-UTN/profesores

# Agregar entradas a /etc/fstab para el montaje persistente
{
    echo "/dev/sdb1   /Examenes-UTN/alumno_1/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb2   /Examenes-UTN/alumno_1/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb3   /Examenes-UTN/alumno_1/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb4   /Examenes-UTN/alumno_2/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb5   /Examenes-UTN/alumno_2/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb6   /Examenes-UTN/alumno_2/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb7   /Examenes-UTN/alumno_3/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb8   /Examenes-UTN/alumno_3/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb9   /Examenes-UTN/alumno_3/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb10  /Examenes-UTN/profesores            ext4    defaults    0    2"
} | sudo tee -a /etc/fstab
