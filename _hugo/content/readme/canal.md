---
title: "canal"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# canal
En este caso se trata de simular el colapso de una columna de agua a través de un canal con pendiente positiva. En este caso se utiliza la utilidad *snappyHexMesh* para realizar el tallado del modelo, generado en OpenSCAD y definidas las regiones desde Blender. Así mismo, se utiliza Docker, para ejecutar las simulaciones sin necesidad de instalar las librerías de OpenFOAM.

## Resumen de los pasos a realizar
- Generar la geometría mediante OpenSCAD y exportarlo a STL.
- Utilizar Blender para separar el objeto en regiones (*patches*) y exportarlo a un nuevo STL.
- Crear una malla base con `blockMeshDict`.
- Tallar el modelo en la malla base mediante `snappyHexMeshDict`.
- Copiar el caso a la carpeta compartida de Docker.
- Arrancar Docker.
- Entrar en la carpeta del caso y ejecutar el resolvedor.
- Salir de Docker.
- Arrancar ParaView y abrir el fitxero .foam, donde se montarán los resultados generados por OpenFOAM.

## Estructura mínima de ficheros necesaria para ejecutar un caso

+ case
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

Finalmente se exporta a formato STL para poder ejecutarlo desde Blender, el fichero se encuentra en `/of-dsgn/STL/canal2D.stl`. Las tareas de escalado, rotación o traslación del objeto es recomendable realizarlas antes de pasar al Blender.

### Blender
*Herramienta de fuentes libres y abiertas para la creación de modelos en 3D, disponble para la mayoría de sistemas operativos bajo la licencia GNU General Public License. Para usar Blender con OpenFOAM se añaden los complementos* [1.SwiftBlock y SwiftSnap] *permitiendo que el usuario pueda especificar el nombre de las áreas, configurar la resolución y el mallado de las capas superficiales.*

Se ejecuta el Blender y se importa el modelo `canal2D.stl` para definir las regiones. Antes que nada, se debe comprobar que los complementos (add-on) correspondientes a OpenFOAM están activado. Accediendo a las opciones de usuario `Ctrl+Alt+U` o File>UserPreferences>openfoam>swiftSnap. 
Si es la primera vez que se arranca el programa será necesario descargar los complementos alojados en gitHub [2.SwiftBlock] para crear el diccionario `blockMeshDict`, [3.SwiftSnap] para crear el diccionario `snappyHexMeshDict`. 
BlockMesh
- Para BlockMesh: `git clone https://github.com/nogenmyr/swiftBlock.git`.
- Copiar los archivos de extensión `*.py` en la carpeta de instalación de Blender, ruta:  <usr/scripts/addons/swiftBlock> habiendo creado la última carpeta previamente: `sudo cp ~/Descargas/Blender/blender_utils.py ~/Descargas/Blender/__init__.py ~/Descargas/Blender/previewMesh.py ~/Descargas/Blender/utils.py /usr/share/blender/2.76/scripts/addons/swiftBlock/`
- Arrancar Blender, activar los complementos necesarios `all>import/Export STL. Community>OpenFOAM>swiftBlock` e importar el archivo STL.
- Desde `Edit Mode` se seleccionan las caras que pertenezcan a una misma región y pulsando la tecla `P` y indicando `Selection`, se agruparán dichas caras a un nuevo objeto.
- Esta operación se repetirá, tantas veces como regiones se quieran definir, y se renombrarán coherentemente en el árbol de objetos, tanto los objetos como su subestructura (vértices y líneas que conforman una cara, como se va a utilizar snapyyHexMesh, no se realiza un mallado preciso, manteniendo la división predefinida por OpenSCAD). En este caso se definen las caras superiores como `atmosphere`, las caras anteriores y posteriores como `frontback` y las restantes como `allwall`.
- Se exporta cada objeto por separado en formato STL, escogiendo el lenguaje ASCII, en `/of-dsgn/STL/canal2D_STL`
- El modelo de Blender se podrá hallar en `of-dsgn/blender/canal2D.blend`.
- Cada objeto se encuentra en un fichero cuya primera línea es `solid Exported from Blender-2.75 (sub 0)` y la última `endsolid Exported from Blender-2.75 (sub 0)`. Se sustituye para incluir el nombre de la región (por ejemplo, `solid atmosphere` y `endsolid atmosphere`), y se une el contenido de todos ellos en un solo fichero, `/of-run/canal2D/constant/triSurface/canal2D.stl`.

### Preparación del BlockMeshDict de base
La cual, definirá la extensión del dominio computacional y el nivel base de densidad del mallado. A la hora de diseñar el `blockMeshDict`, sus dimensiones deberánse deberá tener en cuenta los criterios indicados en [4.User Guide/snnapyHexMesh].
- La malla estará conformada puramente de hexaedros.
- La proporción del mallado es recomendable que sea 1:1:1, de lo contrario la convergencia del algoritmo sería lenta y podría dar lugar a error en coincidencia de puntos.
- Deberá haber al menos una celda que interseccione con cada región del modelo. Además, las dimensiones del mallado de base deberán acoger por completo el modelo que se "tallará".

---
[1.SwiftBlock y SwiftSnap](https://openfoamwiki.net/index.php/Blender)
[2.SwiftBlock](https://openfoamwiki.net/index.php/Contrib/SwiftBlock)
[3.SwiftSnap](https://openfoamwiki.net/index.php/Contrib/SwiftSnap)
[4.User Guide/snnapyHexMesh](http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1540005.4.2)
