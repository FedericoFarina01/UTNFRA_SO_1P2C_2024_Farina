#!/bin/bash
echo "Script Punto C"
sudo groupadd p1c2_2024_gAlumno
sudo groupadd 1c2_2024_gProfesores

sudo useradd -m -s /bin/bash -c "alumno 1" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A1

sudo useradd -m -s /bin/bash -c "alumno 2" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A2

sudo useradd -m -s /bin/bash -c "alumno 3" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A3

sudo useradd -m -s /bin/bash -c "profesor 1" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gProfesores p1c2_2024_P1

sudo mkdir -p /Examenes-UTN/{alumno_{1..3},profesores}
sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 775 /Examenes-UTN/profesores
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

