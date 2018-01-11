---
title: "Fases CFD"
---

# Fases

## Pre-proceso

### Geometría del caso

Se genera la geometría del modelo OWC (Oscillating Wave Column) mediante el software OpenSCAD `modelo.scad` para exportarlo en formato STL (STereo Lithography) con el nombre de `modelo.stl`.

Siguiendo el ejemplo del *Tutorial del Aliviadero* [1] se define como malla de fondo el tanque de olas que actuará como límite del problema a analizar. La altura del agua se define acorde a la altura media que el sensor es capaz de medir. En este caso el nombre del fichero corresponde a `tanque.stl`.

### Generación del mallado

En OpenFOAM el mallado se carga a través de la orden blockMesh [2] o snappyHexMesh [3]. La primera opción, resulta sencilla de interpretar y de manipular cuando se trata de  geometrías sencillas; pero cuando los diseños se vuelven algo más complejos se suele utilizar la segunda opción. 

Adicionalmente, existen otras muchas opciones para realizar el mallado a través de diferentes programas que luego OpenFOAM podrá reconocer. La lista de los softwares, que cuentan con una orden directa para ser exportados, se encuentran en la tabla de conversión de malla [4]. 

Se opta por el NetGen como herramienta para realizar el mallado. Se trata de un programa capaz de importar archivos en formato STL, crear diferentes tipos de malla y exportarlas en formato de archivo neutro para después convertirlo a OpenFOAM (a partir de la orden en terminal que aparece en la tabla de conversiones mencionada anteriormente: netgenNeutralToFoam). Además, como el resto de programas utilizados, cuenta con gran variedad de información en la red para aprender a utilizar los diferentes comandos [5], entender con más profundidad como el programa genera el mallado sobre una geometría dada [6] o las ecuaciones para diferentes cálculos [7].

Otra alternativa por la que se optó fue la del Blender, pero las líneas en las que se divide el mallado había que introducirlas una por una.

Cabe nombrar una última opción que quedó por revisar, la del programa Salome:
- http://www.calumdouglas.ch/openfoam-example-3d-dambreak/
- http://www.cfd-online.com/Forums/openfoam-meshing-open/73971-mesh-conversion-salome-openfoam.html
- http://www.cfd-online.com/Forums/openfoam-meshing-open/76222-boundary-conditions-mesh-exporting.html
- https://www.youtube.com/watch?v=1zQbU-E4k1U
- http://staff.um.edu.mt/__data/assets/pdf_file/0016/106144/Salome_to_OpenFOAM.pdf

### Condiciones de contorno e iniciales
Las condiciones de frontera se establecen en la carpeta /0. En esta carpeta se reúnen las propiedades de cada variable que formará parte del problema (Velocidad, presión, ...). Para verificar las propiedades de turbulencia, se puede utilizar la calculadora de turbulencia CFD en línea [8].

---
[1] http://www.academia.edu/9801380/2_3_13_OpenFOAM_-Aliviadero_Tutorial_-HPC_Wiki_-Confluence_OpenFOAM_-Aliviadero_Tutorial
[2] http://cfd.direct/openfoam/user-guide/blockMesh/#x25-1420005.3
[3] http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1520005.4
[4] http://www.openfoam.org/features/mesh-conversion.php
[5] http://www.netgen-toolbox.org/netgen_usermanual.pdf
[6]https://www.math.uzh.ch/compmath/fileadmin/user/stas/compmath/Abschlussarbeiten/Arnold_Noam/myManual.pdf
[7] http://cfd.direct/openfoam/user-guide/fvschemes/
[8] http://www.cfd-online.com/Tools/turbulence.php


## Procesado

## Post- procesado

www.bu.edu/tech/support/research/training-consulting/online-tutorials/paraview/

