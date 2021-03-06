---
categories: [ nb-refs ]
title: "Snappy"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

- [Acdemica.edu - OpenFOAM_-Aliviadero_Tutorial](http://www.academia.edu/9801380/2_3_13_OpenFOAM_-Aliviadero_Tutorial_-HPC_Wiki_-Confluence_OpenFOAM_-Aliviadero_Tutorial)
- [hpc.ntnu.no/display/hpc/OpenFOAM+-+Cavity+Tutorial](https://www.hpc.ntnu.no/display/hpc/OpenFOAM+-+Cavity+Tutorial)
- [Contrib/swak4Foam](https://openfoamwiki.net/index.php/Contrib/swak4Foam)
- [extend-project.de](http://www.extend-project.de/)

# Elección del entorno de trabajo
 
- Existen entornos cerrados/de pago: StarCCM+, ANSYS Fluent...

- https://en.wikipedia.org/wiki/OpenFOAM#Forks_and_adaptations
- http://www.precisesimulation.com/
- http://www.palabos.org/software/download
- http://code-saturne.org/
- https://www.aero.polimi.it/freecase/?OpenFOAM_%2B_Code_Aster
- http://salome-platform.org
- https://bitbucket.org/fenics-project/
- https://openfoamwiki.net/index.php/Installation/Helyx-OS/Fedora

Para buscar un entorno alternativo libre, el problema puede dividirse en:

- Preparación de la malla
- Definición de las condiciones de entorno
- Elección y configuración del resolvedor
- Ejecución
- Post-procesado y visualización

## Preparación de la malla

La preparación del mallado es muy importante, tanto como los solvers utilizados.
Triángulos, hexaedros, poliedros, normales, surpeficies abiertas/cerradas...

- ¿Qué opciones libres y gratuitas existen?
- ¿Qué características tienen? ¿qué ofrecen?
- ¿Para qué usos están pensadas?
- ¿Por qué `OpenSCAD + Blender + blockMesh + snappyHexMesh`? 

`blockMesh` y `snappyHexMesh` son las aplicaciones utilizadas por defecto en el entorno `OpenFOAM`, y permiten trabajar con cualquier modelo complejo generado en alguno de los entornos de pago o en herramientas CAD de propósito general [cfd.direct/openfoam/user-guide/standard-utilities/](http://cfd.direct/openfoam/user-guide/standard-utilities/#x14-90001r6). También existen conversores para aplicaciones más específicas como `gmsh`, `netgen` o `enGrid`. Por otro lado, Blender es una herramienta avanzada de modelado en 3D que permite tanto trabajar con el mallado, como post-procesar los resultados para obtener visualizaciones de calidad profesional. Además, existen plugins para combinar `Blender` con `blockMesh` y `snappyHexMesh`. Finalmente, `OpenSCAD` ofrece una interfaz mínima y un conjunto limitado de funciones primitivas para generar solidos de forma paramétrica. En cuanto a funcionalidad, no hay diferencias significativas con respecto a las posibilidades de scripting que ofrece Blender, pero la simplicidad de su uso puede resultar más cercana para nóveles.

## Definición de las condiciones de entorno:

- ¿Qué son?
- ¿Qué relación tienen con el problema?
- ¿Qué impacto tienen en la solución?
- ¿Qué tipos existen? olas, navier, ihfoam...

## Elección y configuración del resolvedor:

- ¿Qué es un resolvedor?
- ¿Qué diferencias hay?
- ¿Cuáles tiene `OpenFOAM`?
- ¿Y `helyxOS`, `Salome`?
- IHfoam, ¿problemas con OpenFOAM>2.2.2?

## Ejecución

- Estructura de directorios para cada caso
- Paralelización, `OpenMP`/`MPI`, `decomposeParDict`
- `snappyHexMesh` e `interFoam` pueden ejecutarse en paralelo, IHFoam puede dar algún problema en paralelo.

## Post-procesado y visualización

- `ParaView`
- `Blender`
- `PyLab`
- `gnuplot`
- ...

Entorno libre: OpenFOAM + ParaView + Blender + OpenSCAD + scripts ad-hoc sobre un entorno GNU/Linux, con git (GitHub) como sistema de gestión de versiones

# Resumen de los pasos a realizar

- Se genera un modelo con el número mínimo de puntos mediante OpenSCAD y se exporta a formato STL.
- Se utiliza Blender para separar el objeto en regiones que serán patches, y generar un nuevo STL.
- Con blockMesh (OpenFOAM) se crea una malla base.
- snappyHexMesh (OpenFOAM) talla el STL con regiones en la malla base.
- Después de verificar la configuración de los patches, se ejecuta el resolvedor (OpenFOAM).
- El resultado se post-procesa con PyLab y se visualiza con ParaView y gnuplot.
- Puede utilizarse Blender para obtener renderizados o animaciones más complejas.

# Estructura mínima de ficheros necesaria para la ejecución de blockMesh

```
+ <case>
-+ constant
--+ polyMesh
---- blockMeshDict
-+ system
--- controlDict
```

El fichero `blockMeshDict` deberá contener los campos: FoamFile, converToMeters, vertices, blocks, edges, boundary y mergePatchPairs. Sin embargo, es suficiente con definir ocho puntos y un único bloque, pudiendo dejar los tres últimos en blanco.

El fichero `controlDict` deberá contener los campos: FoamFile, deltaT, writeControl y writeInterval. Aunque, en caso de ejecutar únicamente blockMesh, los parámetros write* no tienen efecto aparente, ya que el resultado se añade al directorio `constant`. Puede encontrarse más información sobre los diferentes parámetros en [cfd.direct/openfoam/user-guide/controlDict](http://cfd.direct/openfoam/user-guide/controlDict/#x19-1060004.3).

Adicionalmente, para que paraFoam se ejecute sin ningún warning, deben incluirse los ficheros fvSchemes y fvSolution en la carpeta system.

# Preparación del fichero STL

https://www.youtube.com/watch?v=ObsFQUiVi1U

El modelo de referencia se ha creado mediante OpenSCAD, y está disponible en `/of-dsgn/SCAD/damBreakMod.scad`. Se ha definido una variable, `neg`, para crear el solido correspondiente al espacio de simulación, o el negativo (los obstáculos y paredes). En lo que respecta al esculpido de snappyHexMesh, la elección es trivial, y ambos modelos pueden utilizarse indistintamente. Sin embargo, a la hora de definir las caras sobre las que actuarán la condiciones de entorno, es preferible utilizar `neg=false`. El solido exportado directamente en formato STL ascii puede encontrarse en `/of-dsgn/STL/damBreakMod.stl`.

Como OpenSCAD no permite diferenciar regiones al exportar el sólido, se ha utilizado Blender. Para trabajar con ficheros STL en Blender, se debe comprobar que el add-on correspondiente está activado, accediendo a las opciones de usuario (Ctrl+Alt+U) y buscando `Import-Export: STL format` en la pestaña `Add-ons`. Tras importar el fichero `/of-dsgn/STL/damBreakMod.stl`, se puede trabajar con cada punto, vértice y cara. Las tareas de escalado/rotación/traslación del objeto es recomendable realizarlas en OpenSCAD, pero cabe utilizar filtros para limpiar y/o mejorar el mallado resultante. Como se va a utilizar snappyHexMesh, no se ha realizado un mallado preciso, y se han mantenido los vértices con ángulos grandes.

Una vez obtenida la malla deseada, en el modo de edición, escogiendo la opción de elección de caras se han seleccionado todas aquellas con las que se desea conformar una región/patch. Teniéndolas selecciónadas se ha pulsado la tecla `P` y se ha seleccionado `Selection` para separar las caras seleccionadas a un nuevo objeto. Se ha repetido esta operación con las caras superiores para `atmospehere`, con todas las caras anteriores y posteriores para `frontback`, y las caras restantes para `allwall`. En el árbol de objetos, se han renombrado coherentemente tantos los objetos como los conjuntos de datos. Finalmente, se ha exportado cada objeto a un fichero STL, escogiendo la opción `ascii` y revisando la definición de los ejes. Pueden consultarse los tres ficheros en `/of-dsgn/STL/damBreakSnappy_STL/` y el fichero de blender en `/of-dsgn/blender/damBreakSnappy_reg.blend`.

Cada objeto/region se encuentra en un fichero cuya primera línea es `solid Exported from Blender-2.75 (sub 0)` y la última `endsolid Exported from Blender-2.75 (sub 0)`. Se ha sustituido en cada uno para incluir el nombre del patch (por ejemplo, `solid atmosphere` y `endsolid atmosphere`), y se ha unido el contenido de todos ellos en un solo fichero, `/of-run/damBreakSnappy/constant/triSurface/damBreakSnappy.stl`.

!!! Sólo he conseguido hacerlo uniendo los tres STL en uno sólo, con regiones. Teóricamente, definiendo `snappyHexMeshDict` adecuadamente, podría no ser necesario unir los ficheros.
!!! Script para unir automáticamente los STL: http://www.cfd-online.com/Forums/openfoam-meshing/61601-blender-export-script-named-ascii-stlbs.html
!!! ¿Cómo se haría con SwiftSnap? Lo he intentado una vez y el resultado ha sido desastroso, porque el `blockMeshDict` que generaba tenía los ejes mal definidos. Pero puede ser muy útil para acelerar el proceso de definir los patches. No recuerdo si genera los STL por separado o los une en uno solo.

# Preparación del `blockMeshDict` de referencia

A la hora de diseñar el `blockMeshDict` que servirá como base para snappyHexMesh, debe generarse un bloque mayor que el modelo a "tallar", y es recomendable que la proporción del mallado sea 1:1:1. De lo contrario, la convergencia del algoritmo es más lenta, y puede llegar a error, tal como se indica en [cfd.direct/openfoam/user-guide/snappyHexMesh](http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1540005.4.2).

Para conocer el tamaño de la caja de contorno del modelo, puede utilizarse la aplicación `surfaceCheck damBreakSnappy.stl`. Si bien es cierto, que al haberlo creado con OpenSCAD y editado con Blender, cualquiera de las aplicaciones puede utilizarse para conocer esta información.

https://ofenfoamwiki.net/index.php/HowTo_lockMesh_with_m4

También debe tenerse en consideración la orientación de los ejes, x/y/z, en función de la definición de vértices/caras del bloque. Una elección inadecuada puede ralentizar considerablemente la ejecución del algoritmo, además de ofrecer resultados incorrectos/inaceptables. Como ejemplo, las definiciones mostradas a continuación producen un mallado equivalente. Nótese la diferencia en la interpretación de los ejes:

```
A: x   y  z
B: -z  y  x
```

Para comprobar el resultado, puede ejecutarse paraFoam después de blockMesh. No debe utilizarse el argumento `-block`, ya que en ese caso sólo se muestra una caja.

```
+++ blockMeshDict.A

vertices (
  (-.25 -.25 .25)
  (8.25 -.25 .25)
  (8.25 4.75 .25)
  (-.25 4.75 .25)
  (-.25 -.25 .75)
  (8.25 -.25 .75)
  (8.25 4.75 .75)
  (-.25 4.75 .75)
);

blocks (
  hex (0 1 2 3 4 5 6 7) (17 9 1) simpleGrading (1 1 1)
);
```

```
+++ blockMeshDict.B

vertices (
  (-.25 -.25 -.25)
  (-.25 -.25 .25)
  (-.25 4.25 .25)
  (-.25 4.25 -.25)
  (8.25 -.25 -.25)
  (8.25 -.25 .25)
  (8.25 4.25 .25)
  (8.25 4.25 -.25)
);

blocks (
  hex (4 5 6 7 0 1 2 3) (1 9 17) simpleGrading (1 1 1)
);
```

# Preparación del fichero `snappyHexMeshDict`

- www.openfoamwiki.net/index.php/SnappyHexMesh
- http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1520005.4
- https://sites.google.com/site/snappywiki/snappyhexmesh/snappyhexmeshdict#TOC-geometry

En el apartado `geometry` se ha cargado el fichero `damBreakSnappy.stl` y se han definido los patches a partir de las regiones que contiene. Al patch `frontback` se le ha dado el nombre `defaultFaces`, ya que al indicar otro nombre snappyHexMesh genera defaultFaces igualmente, y al coincidir con `frontback` esta última no tiene contenido. Otra solución es definir tanto `frontback` como `defaultFaces` en los ficheros `0/alpha.water.org`, `0/U` y `0/p_rgh`, pero se ha optado por definir únicamente `defaultFaces` (además de `atmosphere` y `allwall`, que tienen sus propios nombres).

En las superficies de refinamiento, se ha definido una sólo, correspondiente al nombre del fichero STL completo, e indicando un rango (0,0) en los niveles. Esto es debido a que el caso de referencia que se está utilizando para realizar pruebas, `damBreak` está definido en 2D, y si snappyHexMesh realiza divisiones en el eje Z, las simulaciones resultan en errores de cálculo. Es posible que pueda limitarse snappyHexMesh para que sólo actúe sobre los ejes X e Y, pero como solución inicial se ha decidido incrementar las resolución del `blockMeshDict` y utilizar snappyHexMesh únicamente para hacer snapping.

El resto de opciones se han mantenido prácticamente como en el ejemplo `motorBike`, comentando el contenido del campo `features`, ya que en la prueba inicial no se ha utilizado la aplicación para extraer características. Para reducir el número de ficheros, la línea `#include "meshQualityDict"` se ha sustituido por las opciones contenidas en `caseDicts/mesh/generation/meshQualityDict.cfg`.

# Ejemplo de ejecución

El caso damBreakSnappy contiene los ficheros mínimos necesarios para crear un blockMesh de base. La definición del `blockMeshDict` se corresponde con el caso A del apartado anterior, pero pueden encontrarse ambas versiones en `/of-dsgn/blockMeshDicts/`.

También contiene los ficheros necesarios para ejecutar snappyHexMesh: el modelo en formato STL en la carpeta `triSurface` creada dentro de `constant`, y el diccionario `snappyHexMeshDict` en la carpeta `system`.

Adicionalmente todos los ficheros necesarios para la ejecución del resolvedor, una vez completado el mallado:
- En la carpeta `constant` se encuentran los ficheros g, transportProperties, turbulenceProperties y dynamicMeshDict.
- Se incluye la carpeta `0` con los ficheros alpha.water.org, U y p_rgh.
- Se incluye el fichero setFieldsDict en la carpeta `system`.
- En el fichero controlDict de la carpeta `system` se han incluido las opciones necesarias para ejecutar el resolvedor.

Se pueden ejecutar todas las tareas de formas automatizada mediante la orden `./RunCase damBreakSnappy` desde el directorio `/of-run`. Como puede leerse en el script, `cat /of-run/RunCase`, se ejecutan los siguientes pasos:

- Se ejecuta blockMesh
- Se ejecuta snappyHexMesh
- Se mueven los ficheros correspondientes a la malla creada por blockMesh del directorio `constant` a un directorio `constant.bm`.
- Se mueven los ficheros contenidos en la carpeta 0.002, creados por snappyHexMesh, a la carpeta `constant`. Los ficheros generados por snappyHexMesh tienen el campo `location` en la cabecera. Sin embargo, no se ha observado que éste tenga ningún efecto, más allá del informativo. Por ello, NO es necesario modificar todos los ficheros al copiarlos de `0.002` a `constant`.
- Se eliminan los directorios 0.001 y 0.002.
- Se ejecuta checkMesh para comprobar que la malla es válidad para simular casos en 2D.
- Se copia 0/alpha.water.org a 0/alpha.water
- Se ejecuta setFields. Si se muestra algún error, se debe comprobar que los patches indicados en `constant/polyMesh/boundary` coinciden con los de los ficheros de la carpeta `0`.
- Se ejecuta interFoam. Si la malla no es válida, dará error de coma flotante.
- Se ejecuta paraFoam para visualizar los resultados.
- Se borra `0/alpha.water` al cerrar paraFoam.

Alternativamente, se podría utilizar la opción `-overwrite` al ejecutar snappyHexMesh, para que se sobreescriba el contenido del directorio `constant` creado por blockMesh, en vez de guardarse únicamente en la carpeta `0.002`. Sin embargo, se ha considerado que mantener ambas mallas en directorios separados puede ayudar a entender el proceso.

Una vez finalizada la ejecución y el análisis, puede limpiarse el directorio para dejarlo como se encontraba inicialmente, mediante la ejecución de `./CleanCase damBreakSnappy` desde el directorio `/of-run`. Se mantendrán los cambios realizados sobre los ficheros iniciales, pero se borrarán todos los creados como resultado de la ejecución de las aplicaciones.

# Paso a paso

- Modificar cotas en el fichero .scad
- Compilar y generar STL
- Copiar STL a <`snapcase>/constant/triSurface`
- Ejecutar surfaceCheck `<modelo>.stl` para extraer las dimensiones de la Bounding Box
- Editar `<snapcase>/constant/polyMesh/blockMeshDict` para indicar el tamaño y resolución de la cuadrícula base manteniendo una proporción 1:1
- Ejecutar `./Allclean`
- Ejecutar `blockMesh`
- Editar `<snapcase>/system/snappyHexMeshDict` para indicar el nombre del fichero STL y el de las regiones, además de establecer los niveles de refinamiento, y si se desea 'snap'
- Ejecutar `snappyHexMesh`
- Ejecutar `paraFoam` para visualizar el resultado: en un step aparece el refinamiento mediante cubos y en otro después del 'snap'. Comprobar los patches.
- Si el resultado es satisfactorio, copiar el contenido de la carpeta 2 a `<simcase>/constant`

```
OWCsnapdir
+ constant
-- polyMesh/blockMeshDict
-+ triSurface
---
+ system
-- controlDict
-- snappyHexMeshDict
-- fvSchemes
-- fvSolution
-- meshQualityDict
```

```
OWCsimdir
+ 0 -> from damBreak???
+ constant -> from OWCsnapdir/2
+ system -> from damBreak???
```
