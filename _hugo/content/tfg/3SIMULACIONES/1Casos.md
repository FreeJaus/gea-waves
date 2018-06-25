---
title: "Lista de casos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# 1. CASOS EJECUTADOS

Generalmente, dada la complejidad que implican los códigos que resuelven la dinámica de los flujos en OpenFOAM, se suele tomar como referencia un caso y aplicar los diferentes cambios al mismo.

En un comienzo se parte por el caso "damBreak" (tutorial de OpenFOAM), ya que, por su naturaleza, se asemeja a las condiciones que se podrían ensayar. Además, se simularon diferentes ejemplos de casos, que sirvieron como orientación para añadir nuevas funciones y, así, extraer información adicional. Cada implementación se fue ejecutando por separado para comprobar la ausencia de errores.

Además, cabe mencionar que se trató de implementar las condiciones de contorno para la generación del oleaje a través de las librerías del código ihFOAM. No obstante, dada la complejidad que conlleva su definición tanto en el laboratório como en el modelo, se consideró más apropiado dejarlo para futuros proyectos. Actualmente, estas condiciones, también se han implementado en las versiones de OpenFOAM.  

Por otra parte, una vez obtenida la solución aproximada del modelo por ordenador, se fue adaptando el ensayo hasta llegar a la solución final, lo que implicó, nuevos cambios en el caso. En este apartado se describen y analizan los casos que sirvieron de guía antes de llegar a la solución final, dada en los apartados posteriores /R/XX CANAL 2-D y XX CANAL 3-D.



## 1.1 LISTA DE CASOS 

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


## 1.2 EJECUCIÓN AUTOMATIZADA

Los casos de ejemplo de OpenFOAM, se pueden ejecutar de forma automatizada mediante *scripts*, un *script* es un archivo donde se listan los pasos de la ejecución, es decir, son una serie de órdenes que se irán ejecutando una a una. A este archivo se le añaden permisos de ejecución para que el sistema los reconozca como *scripts* o archivos ejecutables (`chmod +x filename`). 

Teniendo de referencia los *scripts* diseñados para los casos de ejemplo implicados, se aunan en uno sólo, de forma que se describan las ordenes para cada caso estudiado en este proyecto, desde un solo fichero. También se incluye el *script* para borrar el caso y dejarlo como al comienzo, la lista de casos se añade al final del *script* y la forma de ejecutarlos sería la siguiente:

-  `./RunCases.sh CASE`
-  `./CleanCase.sh CASE`

Estas órdenes se pueden utilizar, si se dispone de las librerías necesarias de OpenFOAM instaladas. La mayoría de casos se ejecutan en un portátil con 4 procesadores Intel Core i7-4510U, y con el sistema operativo Fedora 24. También se usa el ordenador del laboratorio con windows 7 (Intel Xeon E5-2630 con 8 procesadores de doble núcleo y 16GB de RAM), luego se emplea una máquina virtual con Ubuntu14. Además, varias pruebas del caso en 3-D se ejecutan en un ordenador de mesa (Intel Core i3-8350K de 4 procesadores y 16GB de RAM) con windows10 mediante la herramienta de *Docker*, la cual no necesita la instalación del programa. La descripción de cómo ejecutar los casos sin necesidad de instalar OpenFOAM en el entorno del usuario se dan en el /R/[Anexo: 1. EJECUCIÓN AUTOMATIZADA].





