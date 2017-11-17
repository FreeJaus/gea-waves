---
title: "ejemploCaso_docker"
---
# Arrancar Docker [1]
0. `sudo dnf install docker-engine`: Instalación de Docker en Fedora [2].
1. `sudo systemctl start docker`: Arranca el demonio de Docker.
2. `sudo docker`: ayuda, información sobre comandos.
3. `docker pull openfoamplus/of_v30plus_rhel66`: Descargar contenedor[3].
4. `sudo docker run -itv /src/geawaves:/opt/geawaves:Z openfoamplus/of_v30plus_rhel66 bash`: para arrancar por primera vez un contenedor.
  * `-i`: permite una conexión interactiva, grabando un patrón en (STDIN) del contenedor.
  * `-t`: asigna una terminal dentro del nuevo contenedor.
  * `-v`: monta un directorio del anfitrion dentro del contenedor. 
  * `:Z`: salta los permisos de seguridad de Linux [4].
  * `openfoamplus/of_v30plus_rhel66`: IMAGEN.
  * `bash`: lanza una terminal dentro del contenedor.
5. `exit`: salir del contenedor.
6. `sudo docker ps -a`: lista de contenedores, más archivos y carpetas ocultas
7. `sudo docker start NAME`: lanzar un contenedor que se ha arrancado con aterioridad. 
8. `sudo docker attach NAME`: unirse al contenedor arrancado.
9. `exit`
10. `sudo docker rm NAME`: borrar el contenedor. 
---
[1](https://docs.docker.com/engine/userguide/)
[2](https://docs.docker.com/engine/installation/linux/fedora/)
[3](https://hub.docker.com/r/openfoamplus/of_v30plus_rhel66/)
[4](http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker)
[How to install OpenFOAM anywhere with Docker](https://www.cfdengine.com/blog/how-to-install-openfoam-anywhere-with-docker/)
[Instalación binaria de OpenFOAM by OpenCFD Ltd](http://www.openfoam.com/download/install-binary.php)

# Simular un caso con OpenFOAM
1. `sudo cp -r ~/WavesGit/of-run/CASE /src/geawaves`: copiar caso a la carpeta compartida con Docker.
2. Arrancar Docker.
3. `sudo cd opt/geawaves`: entrar en la carpeta del caso
4. Ejecutar script.
5. Salir de Docker.

# Visualizar los resultados en ParaView
1. Descargar ya compilado[1]
  * `mkdir ParaView`: Crear una carpeta nueva en home.
  * `cd ParaView`: Entrar.
  * `tar xfz ~/Descargas/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz`: Descomprimir.
2. `cd /src/geawaves/CASE`: Carpeta compartida donde se guardarán los casos ejecutados desde el contenedor para poder visualizarlos en el anfritión. 
3. `touch CASE.foam`: crear archivo vacio [2].
4. `~/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit/bin/paraview`: Arrancar ParaView.
5. Abrir "CASE.foam" (File>Open>CASE.foam).

---
[1](http://www.paraview.org/download/)
[2](http://www.cfd-online.com/Forums/openfoam-post-processing/109190-questions-about-paraview-show-parallel-run-openfoam.html)


