* Información en detalle sobre la instalación binaria de OpenFOAM con Docker
[OpenCFD Ltd (ESI Group) ](http://www.openfoam.com/download/install-binary.php)

* arrancar el demonio de docker:
`sudo systemctl start docker` 
  * hablitar ahora y cuando arranque (no usar salvo que vaya a estar 3 dias sin descanso trabajando):
`enable -> disable`
 
* `sudo docker -v` -> version de docker

* compartir carpeta (src equipo, opt container), :Z saltar los permisos de seguridad de linux:
`sudo docker run -itv /src/geawaves:/opt/geawaves:Z mattshax/openfoam-240 bash`

  * Las diferentes imágenes (con el sistema operativo deseado y la aplicación requerida) se pueden crear o obtener desde [docker hub](https://hub.docker.com/r/mattshax/openfoam-240/).
  * [saltar permisos cada vez que se arranca](http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker)
  * [pasos para que linux no requiera permisos de seguridad](http://stackoverflow.com/questions/32001523/docker-cant-write-to-directory-mounted-using-v-unless-it-has-777-permissions)

* copiar ficheros en el equipo
ej: `sudo cp Documentos/docker.txt  /src/geawaves/`

* desde el container
```cd /opt/geawaves/
touch hola.txt
cat hota.txt
rmhola.txt
```

* salir del contenedor
`exit`

* [sudo docker run mattshax/openfoam_paraview_mesa_2]
(https://hub.docker.com/r/mattshax/openfoam_paraview_mesa_2/)

* [Lista de paquetes sobre openfoam](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=2&pullCount=0&q=openfoam&starCount=0)

* [Dockerfile](https://hub.docker.com/r/quantumhpc/openfoam/~/dockerfile/) es lo que contiene el contenedor de la imagen a ejecutar en docker. Si haríamos un script con este contenido serviría.

* Article:[How to install OpenFOAM anywhere with Docker](https://www.cfdengine.com/blog/how-to-install-openfoam-anywhere-with-docker/)

* paraview
[Setting up a ParaView Server](http://www.paraview.org/Wiki/Setting_up_a_ParaView_Server)
[Starting the server](http://www.paraview.org/Wiki/Starting_the_server)

* OpenFOAM binary installation

