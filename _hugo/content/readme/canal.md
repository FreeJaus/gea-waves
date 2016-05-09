---
title: "canal"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# canal
En este caso se trata de simular el colapso de una columna de agua a través de un canal con pendiente positiva.

## Resumen de los pasos a realizar
- Generar la geometría mediante OpenSCAD y exportarlo a STL.
- Utilizar Blender para separar el objeto en regiones (*patches*) y exportarlo a un nuevo STL.
- Crear una malla base con `blockMeshDict`.
- Tallar el modelo en la malla base mediante `snappyHexMeshDict`.

- Copiar el caso a la carpeta compartida de Docker.
- Arrancar Docker.
- Entrar en la carpeta del caso y ejecutar el resolvedor.
- Salir de Docker.

- Generar un archivo vacio de formato FOAM, arrancar ParaView y abrir el fitxero vacio, donde se montarán los resultados generados por OpenFOAM.

## Estructura mínima de ficheros necesaria para ejecutar un caso

+ <case>
 - constant
  + polyMesh > blockMeshDict 
 - system
  + controlDict
  + fvSchemes
  + fvSolution

## Generación del modelo
### OpenSCAD
*Software libre, disponible para GNU/Linux, MS Windows y Apple OS X, utilizado para crear objetos en CAD de sólidos en 3D y exportable en formato STL. Permite definir el diseño por parámetros configurables, dándole al usuario un total control sobre el proceso de modelado. Además, no está enfocado para aspectos artísticos del modelado en 3D, pudiendo restarle tiempo al procesamiento de la solución.*

El diseño que hace referencia al canal del laboratorio, generado con OpenSCAD, se puede encontrar en `/of-dsgn/SCAD/canalOF.scad`. Se ha definido un ángulo de inclinación de 6 grados (originado por una diferencia de altura de 150mm de uno de los apoyos separados 1500mm entre sí).
Dimensiones del depósito: (250x460x320)mm.
Dimensiones del canal: (80x2500x260)mm.

### Blender
*Herramienta de fuentes libres y abiertas para la creación de modelos en 3D, disponble para la mayoría de sistemas operativos bajo la licencia GNU General Public License. Para usar Blender con OpenFOAM se añaden los complementos [1.SwiftBlock y SwiftSnap] permitiendo que el usuario pueda especificar el nombre de las áreas, configurar la resolución y el mallado de las capas de las paredes.*
 
Se ejecuta el Blender y se importa el caso para definir las regiones. Para ello:
1. Se debe comprobar que el add-on correspondiente al uso de Blender para OpenFOAM, está activado. Accediendo a las opciones de usuario (Ctrl+Alt+U). 
  * Si es la primera vez que se arranca el programa, descargar los complementos desde gitHub [2.SwiftBlock] para crear el diccionario blockMeshDict, [3.SwiftSnap] para crear el diccionario snappyHexMeshDict


[1.SwiftBlock y SwiftSnap](https://openfoamwiki.net/index.php/Blender)
[2.SwiftBlock](https://openfoamwiki.net/index.php/Contrib/SwiftBlock)
[3.SwiftSnap](https://openfoamwiki.net/index.php/Contrib/SwiftSnap)
