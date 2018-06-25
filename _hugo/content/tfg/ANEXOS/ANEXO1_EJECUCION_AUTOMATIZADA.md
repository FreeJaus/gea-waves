# ANEXO 1: EJECUCIÓN AUTOMATIZADA

## EJECUCIÓN CON DOCKER

La instalación dependerá del sistema operativo en el que se vaya a ejecutar: 

En **Fedora** se siguen las siguientes instrucciones para arrancar *Docker*:

1. `sudo dnf install docker-engine`: Instalación de Docker en Fedora, [docker-engine]((https://docs.docker.com/engine/installation/linux/fedora/)).
2. `sudo systemctl start docker`: Arrancar Docker.
3. `docker pull NOMBRE_IMAGEN`: Descargar el contenedor.
4. `sudo docker run --rm -itv /src/geawaves:/opt/geawaves:Z openfoamplus/of_v30plus_rhel66 bash`: para arrancar por primera vez un contenedor.
   - `-i`: permite una conexión interactiva, grabando un patrón en (STDIN) del contenedor.
   - `-t`: asigna una terminal dentro del nuevo contenedor.
   - `-v`: monta un directorio del anfitrion dentro del contenedor. 
   - `:Z`: salta los permisos de seguridad de Linux [accessing host directory in docker](http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker).
   - `openfoamplus/of_v30plus_rhel66`: imagen de ejemplo.
   - `bash`: lanza una terminal dentro del contenedor.
   - `--rm`: borrar la imagen del sistema una vez terminado.
5. `exit`: salir del contenedor.
6. `sudo docker ps -a`: lista de contenedores, más archivos y carpetas ocultas
7. `sudo docker start NAME`: lanzar una imagen de un contenedor que se ha arrancado con aterioridad. 

Asimismo, la simulación de un caso se realizaría de la siguiente manera:

1. `sudo cp -r ~/WavesGit/of-run/CASE /src/geawaves`: copiar caso a la carpeta compartida con Docker.
2. Arrancar Docker.
3. `sudo cd opt/geawaves`: entrar en la carpeta del caso
4. Ejecutar script.
5. Salir de Docker.

Finalmente para visualizar los resultados desde ParaView, se puede optar por:

1. Descargar [ParaView]((http://www.paraview.org/download/)) ya compilado. 
   - `mkdir ParaView`: Crear una carpeta nueva en home.
   - `cd ParaView`: Entrar.
   - `tar xfz ~/Descargas/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz`: Descomprimir.
2. `cd /src/geawaves/CASE`: Carpeta compartida donde se guardarán los casos ejecutados desde el contenedor para poder visualizarlos en el anfritión. 
3. `touch CASE.foam`: crear archivo vacio, [openfoam-post-processing]((http://www.cfd-online.com/Forums/openfoam-post-processing/109190-questions-about-paraview-show-parallel-run-openfoam.html)).
4. `~/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit/bin/paraview`: Arrancar ParaView.
5. Abrir "CASE.foam" (File>Open>CASE.foam).

Las instrucciones para instalar Docker en **Windows10** se dan en [Install Docker for Windows](https://docs.docker.com/docker-for-windows/install/), en este caso los pasos que se siguieron fueron los siguientes:

1. El uso habitual de esta herramienta es a través de una terminal, por ello se descarga [MinGW-64](https://mingw-w64.org/doku.php) ([MSYS2](http://www.msys2.org/)) para ejecutar las órdenes necesarias.

2. Así mismo, para ejecutar herramientas que requieran interfaz gráfica, tal y como se detalla en [1138-4EB](https://github.com/1138-4EB/elide/wiki/Desktop), la solución reside en compartir un [servidor X](https://en.wikipedia.org/wiki/X_Window_System) (*X window server*) ejecutado desde el anfitrión. //Existen otras formas de remediar este inconveniente como [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing) o [SSH](https://en.wikipedia.org/wiki/Secure_Shell), pero no resultan tan directas//. En plataformas GNU/Linux, se tiene, por defecto, un servidor para visualizar la interfaz gráfica de los programas// lanzados desde terminal//. No obstante, para Windows se necesita instalar el servidor **Xming**, ver [GUI docker apps on Windows](#gui-docker-apps-on-windows).

   Una vez descargado e instalado ejecutar el programa desde la ubicación de la instalación, </c/ProgramFiles(X86)/Xming/XLaunch>, con la siguiente configuración: *multiwindow, clipboard, no access*. Para no tener que repetir este proceso, se dispone de un *script* auxiliar [run_guiapp.sh](https://github.com/FreeJaus/docker-images/blob/master/run_guiapp.sh), el cual define la variable `DISPLAY` para permitir la comunicación entre el contenedor y el servidor X ejecutado desde el anfitrión.

3. Ejecutar el contenedor de docker, a modo de ejemplo se utiliza la última versión de OpenFOAM:

   `winpty docker run -itv --name micont //c/Users/Leire/Documents/gea-waves/gea-waves-develop://opt/geawaves -e DISPLAY=10.0.75.1:0 openfoam/openfoam5-paraview54 bash` 

   - El argumento `winpty` se añade para ejecutar programas, en este caso *Docker*, desde la consola instalada.
   - La opción `-v` monta el volumen `micont` de la carpeta a compartir desde el anfitrión, con la carpeta asignada dentro del contenedor. 
   - Se lanza la imagen con una terminal interactiva mediante `-it` (dependiendo de la imagen con o sin una terminal con la que interactuar).
   - Por último se ejecuta la variable `DISPLAY` con el argumento `-e` para permitir lanzar ParaView desde el contenedor.

4. Se diseña un sript [set_display.sh]() para ejecutar de forma automatizada los pasos anteriores para las siguientes imágenes: "salome", "of5-paraview54", "cfmesh-of41", "blender"

   docker primero buscará entre las imágenes descargadas con anterioridad 

5. Por último, cabe mencionar que se pueden lanzar versiones modificadas de las imágenes, acorde a las necesidades del usuario. Para ello, se puede editar el correspondiente fichero de *Dockerfile*. Esto se realiza con las imágenes para *Salome* y *cfmesh-of41*, como se describe a continuación, y, además, se sube a *Docker Hub* el contenedor para poder ejecutarlo desde cualquier otro ordenador.

   Imágenes modificadas para este estudio:

   - **docker-salome**: Desde la carpeta donde se encuentra el fichero *Dockerfile* se ejecuta `docker build -t l001/salome-mesh`, para comprobar que no haya errores. Por otro lado, para añadir los cambios //a la red/a *Docker Hub* **¿estaría bien subirlas a freejaus**// desde *Portainer* se hace un `docker pull`, una vez que el usuario se halla registrado y habiendo hecho click en la imagen lanzada, para añadir los cambios .
     - *"Dockerfile"*: Se añade a la imagen "msegade/salome" la instalación de libgfortran, para solucionar el error dado en el programa. 
   - **docker-of4-pv5-cfmesh-pyfoam**: Mismo proceso que en el caso anterior.
     - *"Dockerfile"*: Esta vez se añade *pyFoam* a la imagen "fsys/openfoam4-paraview50-cfmesh" para hallar los residuos con las librerías de Python.

## EJECUCIÓN CON TRAVIS

Como se menciona en el apartado /R/[XXDescripción de Herramientas], para la integración continua (*test early*) de cambios en el código que necesiten verificarse, resulta muy útil, ya que la ejecución se realiza en el servidor de *Travis* sin emplear los recursos del entorno del usuario. En este caso esta herramienta resulta interesante para la comprobación de los cambios realizados en casos antes de aunarlos en el caso final.

La ejecución de un caso en [Travis](https://travis-ci.org/) se realiza de la siguiente manera:

1. Se sincroniza con la cuenta de GitHub, donde se crea una rama de prueba con el caso a ejecutar en OpenFOAM.
2. Añadir en el directorio los siguientes ficheros:
   - **"doof41.sh"**: script para ejecutar el caso en la terminal de docker dentro de travis. 
   - **".travis.yml"**: fichero de configuración para ejecutar en el servidor de travis-ic. En este caso, sirve para descargar la imagen de OpenFOAM desde Docker y ejecutar el *script* <./doof41.sh> desde la terminal del contenedor.
3. Los resultados se suben comprimidos a GitHub, aunque si no se ha creado una rama con anterioridad, se creará una con un nombre establecido de forma aleatoria por GitHub.

**NOTA**: Cada vez que se quiera ejecutar un caso desde *Travis*, se debe modificar su contenido de manera que apunten a la ruta del caso. Además, si un trabajo excediese el límite, podría reducirse el tiempo de simulación, ejecutando el caso por partes mediante la utilidad `latestTime`.



