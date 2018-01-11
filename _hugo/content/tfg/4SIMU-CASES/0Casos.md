---
title: "Lista de casos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# 4 CASOS EJECUTADOS

Generalmente, dada la complejidad que implican los códigos que resuelven la dinámica de los flujos, se suele tomar como referencia un caso y aplicar los diferentes cambios al mismo. En este apartado se describen y analizan brevemente los casos realizados antes de llegar al caso final.

## 4.1 Lista de casos 

- **damBreak**: Tutorial de OpenFOAM ubicado en `<$FOAM_RUN/tutorials/multiphase/interFoam/laminar>`. El caso trata modelos multifásicos, 2-D, incompresible, transitorio. Además, utiliza el código interFoam que resuelve las ecuaciones de continuidad y, usando el método VOF, se calcula la interfase. Completamente explicado en [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/).


  -  **damBreakFine**: Incremento de la resolución del mallado del caso anterior. Así mismo, se ejecuta en paralelo siguiendo las explicasiones contenidas en  [User Guide: 3.4 Running applications in parallel](http://cfd.direct/openfoam/user-guide/running-applications-parallel). 


 - **damBreakMod**: Primera aproximación al modelo OWC, variando la geometría del caso anterior desde el fichero `blockMeshDict` incluyendo una cavidad que haga de chimenea. 

 - **damBreakSnappy**: Tal y como se explica en el anexo [Snappy], para generar mallas de alta calidad a partir de un modelo generado desde un programa CAD, OpenFOAM proporciona el diccionario `snappyHexMeshDict`. En este caso, se genera el modelo de forma paramétrica desde OpenSCAD, se exporta a STL, dejando la descomposición mínima compuesta por triángulos (para los cilindros se especifica el número de frames) ya que luego se utilizará snappyHexMesh para el refinado. Se definen los contornos desde Blender ([GitHub/nogenmyr](https://github.com/nogenmyr/swiftBlock)), exportando cada uno por separado en ascii.stl y se juntan después en un solo fichero. Se modifica el diccionario snappyHexMeshDict dejando los campos mínimos necesarios para realizar un mallado básico.

 - **damBreak3d**: Caso damBreak en 3-D, modificando la geometría en el eje *z* y definiendo el contorno de "frontAndBack" de forma apropiada para cada variable del caso. Adicionalmente, se puede modificar el fichero `setFields` para variar el volumen de la columna de agua inicial. Se toma de referencia las explicaciones de [Calum Duglas "damBreak example modified to 3d"](http://www.calumdouglas.ch/openfoam-example-3d-dambreak/).

- **canal2D**: Modelo en 2D del canal del laboratorio con la pared que delimita la cámara y una ranura en la chimenea de salida ($19 mm$ en *z*). Del mismo se obtiene la presión del flujo de aire aguas arriba del diafragma y el caudal de salida, teniendo como referencia los tutoriales:

  -  `simpleFoam/pitzDaily`: a partir del cual se determina cómo obtener los residuos, el valor de las variables de interés en puntos conctretos (*probes*) o en los centros de cada celda contenidas entre dos puntos (*sample*).
  - `multiphase/interFoam/ras/waterChannel`: donde se halla el flujo de salida (*outletFlux*) en la superficie especificada por el usuario mediante una función definida en el diccionario "*controlDict*".

  Ya que el cálculo del flujo de salida se resulve en función del área de la sección que atraviesa, se realiza otro caso considerando la anchura del canal ($80 mm$ en *z*) resultando en una importante variación en el valor del caudal. Por ello, la aproximación en 2-D se considera apropiada para visualizar el comportamiento de los flujos, pero insuficiente para tomar como válidos los valores obtenidos y poder compararlos con los experimentales.   

- **canal3D**: Simulación del caso del laboratorio, realizando las modificaciones necesarias para aproximar el modelo a lo que se experimentará en la realidad. Los resultados que se obtienen son la altura del agua en la cámara, el flujo de salida por la chimenea y la presión manométrica en el mismo punto que en el ensayo.

  Cabe destacar que para la generación del modelo en 3D se estudiaron diferentes alternativas (entre ellas, *snappy*, *cfMesh* y *Salome*) 




Scripts To run automatically
===

Scripts para ejecutar los casos para la versión OF2.4:

- **"RunCases.sh"**
- **"CleanCase.sh"**

**NOTA**: Ficheros modificados para ejecutar los casos OF4.1: "canal3Dcfmesh", "canal3Dsalome" y "owc-D19d12".

Travis
===

Ejecución de un caso en Travis:

- **"doof41.sh"**: script para ejecutar el caso en la terminal de docker dentro de travis. 
- **".travis.yml"**: configuration file for travis-ci. In a docker container based on golang:alpine, run travis-ci.sh. Contiene las órdenes a ejecutar en el servidor de travis (descargar un contenedor linux con la imagen de OF, y ejecutar el script <doof41.sh> en la terminal del contenedor. Además se suben los resultados comprimidos a gitHub.

**NOTA**: Cada vez que se quiera ejecutar un caso desde travis, se debe modificar su contenido de manera que apunten a la ruta del caso. Además si no se ha generado un "tag" en github se generará uno con un nombre aleatorio, para guardar los resultados del caso.

Docker
===

- **"set_display.sh"**:  script que permite ejecutar los contenedores (listados al final: "salome", "of5-paraview54", "cfmesh-of41", "blender") desde windows10 o linux. 

Subir un contenedor, para añadir cambios a uno existente:

- **docker-salome**: Desde esta carpeta se ejecuta `docker build -t l001/salome-mesh` . Desde portainer se hace un `docker pull` una vez que el usuario se halla registrado y habiendo hecho click en la imagen lanzada.
  - *"Dockerfile"*: Se añade a la imagen "msegade/salome" la instalación de libgfortran, para solucionar el error dado en el programa. 
- **docker-of4-pv5-cfmesh-pyfoam**: Mismo proceso que en el caso anterior.
  - *"Dockerfile"*: Esta vez se añade *pyFoam* a la imagen "fsys/openfoam4-paraview50-cfmesh".