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
- **canal2Dowc19-12-19**: canal del laboratorio con el montaje del diafragma, en 2D con una anchura de 19mm en 'z'. Caso que sierve para comparar los resultados del flujo en la salida, con el siguiente caso.
- **canal2Dowc19-12-80**:  mismo caso que el anterior, variando la anchura en 'z' a 80mm. Se comprueba que OpenFOAM considera la z definida en blockMeshDict para calcular valores como, por ejemplo, el área.
- **canal3Dcfmesh**: caso no estable, consultar readme en <_hugo/content/readme/canal3D-cfmesh.md>.
- **canal3Dsalome**: medidas del canal no exactas al ensayo experimentado, caso que sirve para comparar los resultados con el caso ejecutado desde el StarCCM+.
- **owc-D19d12** : simulación final del caso con las medidas del ensayo, se obtienen los resultados de la altura del agua en la cámara, el flujo de salida por la chimenea y la presión manométrica en el mismo punto que en el ensayo. Estos resultados servirán para comparar lo experimentado en el laboratorio.

# Scripts To run automatically

Scripts para ejecutar los casos para la versión OF2.4:

* **"RunCases.sh"**
* **"CleanCase.sh"**

**NOTA**: Ficheros modificados para ejecutar los casos OF4.1: "canal3Dcfmesh", "canal3Dsalome" y "owc-D19d12".

# Travis

Ejecución de un caso en Travis:

* **"doof41.sh"**: script para ejecutar el caso en la terminal de docker dentro de travis. 
* **".travis.yml"**: configuration file for travis-ci. In a docker container based on golang:alpine, run travis-ci.sh. Contiene las órdenes a ejecutar en el servidor de travis (descargar un contenedor linux con la imagen de OF, y ejecutar el script <doof41.sh> en la terminal del contenedor. Además se suben los resultados comprimidos a gitHub.


**NOTA**: Cada vez que se quiera ejecutar un caso desde travis, se debe modificar su contenido de manera que apunten a la ruta del caso. Además si no se ha generado un "tag" en github se generará uno con un nombre aleatorio, para guardar los resultados del caso.

# Docker

- **"set_display.sh"**:  script que permite ejecutar los contenedores (listados al final: "salome", "of5-paraview54", "cfmesh-of41", "blender") desde windows10 o linux. 

Subir un contenedor, para añadir cambios a uno existente:

- **docker-salome**: Desde esta carpeta se ejecuta `docker build -t l001/salome-mesh` . Desde portainer se hace un `docker pull` una vez que el usuario se halla registrado y habiendo hecho click en la imagen lanzada.
  - *"Dockerfile"*: Se añade a la imagen "msegade/salome" la instalación de libgfortran, para solucionar el error dado en el programa. 
- **docker-of4-pv5-cfmesh-pyfoam**: Mismo proceso que en el caso anterior.
  - *"Dockerfile"*: Esta vez se añade *pyFoam* a la imagen "fsys/openfoam4-paraview50-cfmesh".