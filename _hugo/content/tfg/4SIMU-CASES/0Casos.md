---
title: "Lista de casos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# 4 CASOS EJECUTADOS

Generalmente, dada la complejidad que implican los códigos que resuelven la dinámica de los flujos en OpenFOAM, se suele tomar como referencia un caso y aplicar los diferentes cambios al mismo.

En un comienzo se parte por el caso "damBreak" (tutorial de OpenFOAM), ya que, por su naturaleza, se asemeja a las condiciones que se podrían ensayar. Además, se simularon diferentes ejemplos de casos, que sirvieron como orientación para añadir nuevas funciones y, así, extraer información adicional. Cada implementación se fue ejecutando por separado para comprobar la ausencia de errores.

Además, cabe mencionar que se trató de implementar las condiciones de contorno para la generación del oleaje a través de las librerías del código ihFOAM. No obstante, dada la complejidad que conlleva su definición tanto en el laboratório como en el modelo, se consideró más apropiado dejarlo para futuros proyectos. Actualmente, estas condiciones, también se han implementado en las versiones de OpenFOAM.  

Por otra parte, una vez obtenida la solución aproximada del modelo por ordenador, se fue adaptando el ensayo hasta llegar a la solución final, lo que implicó, nuevos cambios en el caso. En este apartado se describen y analizan los casos que sirvieron de guía antes de llegar a la solución final, dada en los apartados posteriores XX CANAL 2-D y XX CANAL 3-D.



## 4.1 Lista de casos 

- **damBreak**: Tutorial de OpenFOAM ubicado en `<$FOAM_RUN/tutorials/multiphase/interFoam/>`. El caso trata modelos multifásicos, 2-D, incompresible, transitorio, con y sin turbulencia. Además, utiliza el código interFoam que resuelve las ecuaciones de continuidad y, usando el método VOF, se calcula la interfase. Completamente explicado en [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/).


  -  **damBreakFine**: Incremento de la resolución del mallado del caso anterior. Así mismo, se ejecuta en paralelo siguiendo las explicasiones contenidas en  [User Guide: 3.4 Running applications in parallel](http://cfd.direct/openfoam/user-guide/running-applications-parallel). 


 - **damBreakMod**: Primera aproximación al modelo OWC, variando la geometría del caso anterior desde el fichero *blockMeshDict* incluyendo una cavidad que haga de cámara. 

 - **damBreakSnappy**: Tal y como se ha mencionado OpenFOAM proporciona el diccionario *snappyHexMeshDict*, para generar mallas de alta calidad a partir de un modelo generado desde un programa CAD. En este caso, se genera el modelo de forma paramétrica desde OpenSCAD, se exporta a STL, dejando la descomposición mínima compuesta por triángulos (para los cilindros se especifica el número de frames) ya que, luego se utilizará snappyHexMesh para el refinado. Se definen los contornos desde Blender ([GitHub/nogenmyr](https://github.com/nogenmyr/swiftBlock)), exportando cada uno por separado en ascii.stl y se juntan después en un solo fichero. Se modifica el diccionario snappyHexMeshDict dejando los campos mínimos necesarios para realizar un mallado básico.

 - **damBreak3d**: Caso damBreak en 3-D, modificando la geometría en el eje *z* y definiendo el contorno de "frontAndBack" de forma apropiada para cada variable del caso. Adicionalmente, se puede modificar el fichero `setFields` para variar el volumen de la columna de agua inicial. Se toma de referencia las explicaciones de [Calum Duglas "damBreak example modified to 3d"](http://www.calumdouglas.ch/openfoam-example-3d-dambreak/).

- **canal2D**: Modelo en 2D del canal del laboratorio con la pared que delimita la cámara y una ranura en la chimenea de salida ($19 mm$ en *z*). Del mismo se obtiene la presión del flujo de aire aguas arriba del diafragma y el caudal de salida, teniendo como referencia los tutoriales:

  -  `simpleFoam/pitzDaily`: a partir del cual se determina cómo obtener los residuos, el valor de las variables de interés en puntos conctretos (*probes*) o en los centros de cada celda contenidas entre dos puntos (*sample*).
  -  `multiphase/interFoam/ras/waterChannel`: donde se halla el flujo de salida (*outletFlux*) en la superficie especificada por el usuario mediante una función definida en el diccionario "*controlDict*".
  -  `multiphase/potentialFreeSurfaceFoam/oscillatingBox`: mediante el cual se añaden paredes al modelo con la función *topoSet*, permitiendo realizar modificaciones parciales en la geometría (generada a partir de blockMesh).

  Ya que el cálculo del flujo de salida se resulve en función del área de la sección que atraviesa, se realiza otro caso considerando la anchura del canal ($80 mm$ en *z*) resultando en una importante variación en el valor del caudal. Por ello, la aproximación en 2-D se considera apropiada para visualizar el comportamiento de los flujos, pero insuficiente para tomar como válidos los valores obtenidos y poder compararlos con los experimentales.   

- **canal3D**: Simulación del caso del laboratorio, realizando las modificaciones necesarias para aproximar el caso a lo que se experimentará en la realidad. El modelo se genera a partir del programa *Salome*, se modifican algunos valores de las propiedades físicas y los resultados se procesan desde *ParaView* a partir de *scripts* escritos en *Python*. Estos extraen el valor medio de la altura del agua en la cámara y la presión manométrica en el mismo punto que en el ensayo, a lo largo del tiempo. Además se obtiene el flujo de salida a través del diafragma, del mismo modo que para el caso en 2-D.

  ​


## 4.2 Ejecución automatizada

Los casos de ejemplo de OpenFOAM, se pueden ejecutar de forma automatizada mediante *scripts*, un *script* es un archivo donde se listan los pasos de la ejecución, es decir, son una serie de órdenes que se irán ejecutando una a una. A este archivo se le añaden permisos de ejecución para que el sistema los reconozca como *scripts* o archivos ejecutables (`chmod +x filename`). 

Teniendo de referencia los *scripts* diseñados para los casos de ejemplo implicados, se aunan en uno sólo, de forma que se describan las ordenes para cada caso estudiado en este proyecto, desde un solo fichero. También se incluye el *script* para borrar el caso y dejarlo como al comienzo, la lista de casos se añade al final del *script* y la forma de ejecutarlos sería la siguiente:

-  `./RunCases.sh CASE`
-  `./CleanCase.sh CASE`

Estas órdenes se pueden utilizar, si se dispone de las librerías necesarias de OpenFOAM instaladas. La mayoría de casos se ejecutan en un portátil con 4 procesadores Intel Core i7-4510U, y con el sistema operativo Fedora 24. También se usa el ordenador del laboratorio con windows 7 (Intel Xeon E5-2630 con **¿¿8 procesadores de doble núcleo??** y 16GB de RAM), luego se emplea una máquina virtual con Ubuntu14. Además, varias pruebas del caso en 3-D se ejecutan en un ordenador de mesa (Intel Core i3-8350K de 4 procesadores y 16GB de RAM) con windows10 mediante la herramienta de *Docker*, la cual no necesita la instalación del programa. A continuación se describen dos formas diferentes de ejecutar los casos sin necesidad de instalar OpenFOAM en el entorno del usuario:



### 4.2.1 Ejecución con Docker

La instalación dependerá del sistema operativo en el que se vaya a ejecutar. //ANEXAR?/En **Fedora** se siguen las siguientes instrucciones para arrancar *Docker*:

1. `sudo dnf install docker-engine`: Instalación de Docker en Fedora, [docker-engine]((https://docs.docker.com/engine/installation/linux/fedora/)).
2. `sudo systemctl start docker`: Arrancar Docker.
3. `docker pull NOMBRE_IMAGEN`: Descargar el contenedor.
4. `sudo docker run --rm -itv /src/geawaves:/opt/geawaves:Z openfoamplus/of_v30plus_rhel66 bash`: para arrancar por primera vez un contenedor.
     * `-i`: permite una conexión interactiva, grabando un patrón en (STDIN) del contenedor.
     * `-t`: asigna una terminal dentro del nuevo contenedor.
     * `-v`: monta un directorio del anfitrion dentro del contenedor. 
     * `:Z`: salta los permisos de seguridad de Linux [accessing host directory in docker](http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker).
     * `openfoamplus/of_v30plus_rhel66`: imagen de ejemplo.
     * `bash`: lanza una terminal dentro del contenedor.
     * `--rm`: borrar la imagen del sistema una vez terminado.
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
  * `mkdir ParaView`: Crear una carpeta nueva en home.
  * `cd ParaView`: Entrar.
  * `tar xfz ~/Descargas/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz`: Descomprimir.
2. `cd /src/geawaves/CASE`: Carpeta compartida donde se guardarán los casos ejecutados desde el contenedor para poder visualizarlos en el anfritión. 
3. `touch CASE.foam`: crear archivo vacio, [openfoam-post-processing]((http://www.cfd-online.com/Forums/openfoam-post-processing/109190-questions-about-paraview-show-parallel-run-openfoam.html)).
4. `~/ParaView-5.0.1-Qt4-OpenGL2-MPI-Linux-64bit/bin/paraview`: Arrancar ParaView.
5. Abrir "CASE.foam" (File>Open>CASE.foam).



Las instrucciones para instalar Docker en **Windows10** se dan en [Install Docker for Windows](https://docs.docker.com/docker-for-windows/install/), en este caso los pasos que se siguieron fueron los siguientes:

1. El uso habitual de esta herramienta es a través de una terminal, por ello se descarga [MinGW-64](https://mingw-w64.org/doku.php) ([MSYS2](http://www.msys2.org/)) para ejecutar las órdenes necesarias.

2. //Tras la instalación de Docker, se descarga el fichero [docker-compose.yml]() desarrollado por la comunidad, el cual permite lanzar [Portainer](https://portainer.io/) en el navegador para interactuar con Docker gráficamente. Para ello desde la carpeta que contiene dicho archivo se ejecutan los siguientes pasos para su uso: 

   - Para lanzar *Portainer*, se introduce por terminal la orden: `docker-compose up -d` (*-d* se emplea para no ver la ejecución del proceso y poder seguir utilizando la misma terminal). 
   - Acceder desde el navegador a dicho proceso: `localhost:9000`.
   - Si se desea terminar el proceso, sustituir en la primera orden `up` por `down`.//

3. Así mismo, para ejecutar herramientas que requieran interfaz gráfica, tal y como se detalla en [1138-4EB](https://github.com/1138-4EB/elide/wiki/Desktop), la solución reside en compartir un [servidor X](https://en.wikipedia.org/wiki/X_Window_System) (*X window server*) ejecutado desde el anfitrión. //Existen otras formas de remediar este inconveniente como [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing) o [SSH](https://en.wikipedia.org/wiki/Secure_Shell), pero no resultan tan directas//. En plataformas GNU/Linux, se tiene, por defecto, un servidor para visualizar la interfaz gráfica de los programas// lanzados desde terminal//. No obstante, para Windows se necesita instalar el servidor **Xming**, ver [GUI docker apps on Windows](#gui-docker-apps-on-windows).

   Una vez descargado e instalado ejecutar el programa desde la ubicación de la instalación, </c/ProgramFiles(X86)/Xming/XLaunch>, con la siguiente configuración: *multiwindow, clipboard, no access*. Para no tener que repetir este proceso, se dispone de un *script* auxiliar [run_guiapp.sh](https://github.com/FreeJaus/docker-images/blob/master/run_guiapp.sh), el cual define la variable `DISPLAY` para permitir la comunicación entre el contenedor y el servidor X ejecutado desde el anfitrión.

4. Ejecutar el contenedor de docker, a modo de ejemplo se utiliza la última versión de OpenFOAM:

   `winpty docker run -itv --name micont //c/Users/Leire/Documents/gea-waves/gea-waves-develop://opt/geawaves -e DISPLAY=10.0.75.1:0 openfoam/openfoam5-paraview54 bash` 

   - El argumento `winpty` se añade para ejecutar programas, en este caso *Docker*, desde la consola instalada.
   - La opción `-v` monta el volumen `micont` de la carpeta a compartir desde el anfitrión, con la carpeta asignada dentro del contenedor. 
   - Se lanza la imagen con una terminal interactiva mediante `-it` (dependiendo de la imagen con o sin una terminal con la que interactuar).
   - Por último se ejecuta la variable `DISPLAY` con el argumento `-e` para permitir lanzar ParaView desde el contenedor.

5. Se diseña un sript [set_display.sh]() para ejecutar de forma automatizada los pasos anteriores para las siguientes imágenes: "salome", "of5-paraview54", "cfmesh-of41", "blender"

   docker primero buscará entre las imágenes descargadas con anterioridad 

6. Por último, cabe mencionar que se pueden lanzar versiones modificadas de las imágenes, acorde a las necesidades del usuario. Para ello, se puede editar el correspondiente fichero de *Dockerfile*. Esto se realiza con las imágenes para *Salome* y *cfmesh-of41*, como se describe a continuación, y, además, se sube a *Docker Hub* el contenedor para poder ejecutarlo desde cualquier otro ordenador.

   //para añadir cambios a uno existente://

   - **docker-salome**: Desde la carpeta donde se encuentra el fichero *Dockerfile* se ejecuta `docker build -t l001/salome-mesh`, para comprobar que no haya errores. Por otro lado, para añadir los cambios //a la red/a *Docker Hub* **¿estaría bien subirlas a freejaus**// desde *Portainer* se hace un `docker pull`, una vez que el usuario se halla registrado y habiendo hecho click en la imagen lanzada, para añadir los cambios .
     - *"Dockerfile"*: Se añade a la imagen "msegade/salome" la instalación de libgfortran, para solucionar el error dado en el programa. 
   - **docker-of4-pv5-cfmesh-pyfoam**: Mismo proceso que en el caso anterior.
     - *"Dockerfile"*: Esta vez se añade *pyFoam* a la imagen "fsys/openfoam4-paraview50-cfmesh" para hallar los residuos con las librerías de Python.


### 4.2.2 Ejecución con Travis

Como se menciona en el apartado [XXDescripción de Herramientas], para la integración continua (*test early*) de cambios en el código que necesiten verificarse, resulta muy útil, ya que la ejecución se realiza en el servidor de *Travis* sin emplear los recursos del entorno del usuario. En este caso esta herramienta resulta interesante para la comprobación de los cambios realizados en casos antes de aunarlos en el caso final.

La ejecución de un caso en [Travis](https://travis-ci.org/) se realiza de la siguiente manera:

1. Se sincroniza con la cuenta de GitHub, donde se crea una rama de prueba con el caso a ejecutar en OpenFOAM.
2. Añadir en el directorio los siguientes ficheros:
   - **"doof41.sh"**: script para ejecutar el caso en la terminal de docker dentro de travis. 
   - **".travis.yml"**: fichero de configuración para ejecutar en el servidor de travis-ic. En este caso, sirve para descargar la imagen de OpenFOAM desde Docker y ejecutar el *script* <./doof41.sh> desde la terminal del contenedor.
3. Los resultados se suben comprimidos a GitHub, aunque si no se ha creado una rama con anterioridad, se creará una con un nombre establecido de forma aleatoria por GitHub.

**NOTA**: Cada vez que se quiera ejecutar un caso desde *Travis*, se debe modificar su contenido de manera que apunten a la ruta del caso. Además, si un trabajo excediese el límite, podría reducirse el tiempo de simulación, ejecutando el caso por partes mediante la utilidad `latestTime`.



