gea-waves/runcases
==================

# Casos ejecutados

## versión OpenFOAM 2.4.0
- **damBreak**: [tutorial de OpenFOAM](https://cfd.direct/openfoam/user-guide/dambreak/) para modelos multifásicos, 2D, incompresible, transitorio. Utiliza interFoam solver, que resuelve las ecs de continuidad, y usando el método VOF se calcula la interfase.
- **damBreakFine**: mismo caso, modificando la geometría del mallado <constant/polyMesh/blockMeshDict>. `simpleGrading (1 2 1)` hace que se refine el fondo, disminuyendo el tamaño de celdas a la mitad en proporción a las celdas superiores en el eje *y*.
- **damBreakMod**: modificar vértices del modelo desde <constant/polyMesh/blockMeshDict>.
- **damBreakSnappy**: obtener el modelo desde un programa CAD. En este caso, se genera el modelo de forma paramétrica desde OpenSCAD, se exporta a STL, dejando la estructura triangular gruesa (para los cilindros se especifica el número de frames) ya que luego se utilizará snappyHexMesh para el refinado. Se definen los contornos desde Blender, exportando cada uno por separado en ascii.stl y se juntan después en un solo fichero. Se modifica el diccionario snappyHexMeshDict. [+info en _hugo/content/readme/snappy]
- **damBreakSwiftBlock**: intento fallido al generar el fichero blockMeshDict desde Blender, problema con los ejes. 
	- Para este caso se deben añadir las librerías, SwiftBlock and SwiftSnap, que permiten usar [Blender con OpenFOAM](https://openfoamwiki.net/index.php/Blender).
- **damBreak3d**: caso damBreak en 3D, modificando la geometría y definiendo el contorno de "frontAndBack" de forma apropiada para cada variable del caso.

## versión OpenFOAM 4.1
- **canal2D**: caso del lab, ref damBreakMod
	- canal2DsL
	- canal2DsRAS
	- canal2DsRAS_sample
- **canal3D**
	- canal3DsL
	- canal3DsRAS
	- canal3DsRAS_probes
	- canal3DsRAS_refi

# Ficheros

Scripts para ejecutar los casos para la versión OF2.4:

* **runcases.sh**
* **CleanCase.sh**

Ejecución de un caso en Travis:

* **doof41.sh**: script para ejecutar el caso en la terminal de docker dentro de travis.
* **.travis.yml**: configuration file for travis-ci. In a docker container based on golang:alpine, run travis-ci.sh. Contiene las órdenes a ejecutar en el servidor de travis (descargar un contenedor linux con la imagen de OF, y ejecutar el script <doof41.sh> en la terminal del contenedor. Además se suben los resultados comprimidos a gitHub.

