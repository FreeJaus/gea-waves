[cfMesh v1.1 User Guide](http://cfmesh.com/wp-content/uploads/2015/09/User_Guide-cfMesh_v1.1.pdf)

cfMesh es una librería multiplataforma para la generación automatizada de mallas construido sobre OpenFOAM® [*None of the OpenFOAM® related offering by Creative Fields, Ltd., including cfMesh, is approved or endorsed by OpenCFD, Ltd. (ESI Group), producer of the OpenFOAM® software. OpenFOAM® and OpenCFD® are registered trade marks of ESI Group*]. Está desarrollado bajo licencia GPL, y es compatible con todas las versiones recientes de OpenFOAM y foam-extend.

# Diccionarios requeridos

El proceso de mallado está determinado en el diccionario <./system/meshDict>. For parallel meshing (MPI), <system/descomposeParDict>, y el número de nodos usados para la ejecución en paralelo deberá corresponder al *numberOfSubdomains* en **descomposeParDict**.

El volumen de malla resultante se escribe en el directorio <constant/polyMesh>.

# Procedimiento

Ejecutar por separado la malla y el caso.

## Mesh

### 1. Prueba

Tomando como referencia el caso "singleOrifice" y canal3D estructura del caso:

- 0: vacio
- constan: vacio
- system:
  - fvSchemes
  - fvSolution
  - meshDict: entradas requeridas **surfaceFile** y **maxCellSize**.
  - controlDict: aumentar writeInterval >1 then set to 300

### 2. Prueba

Referencia elbow

- system:
  - controlDict: 0-12; dT 0.01; wI 3.
  - fvSchemes: divSchemes, laplacianSchemes (and fluxRequired<.OF4) from damBreak_RAS/canalRAS.
  - fvSolution: all from damBreak_RAS/canalRAS case.
  - meshDict: 
    - maxCS 	1.25
    - boundaryCS 0.625
    - minCS0.5
    - localRef {outlet - cS 0.625 - refiThick 2.5}
    - boundLayers { 3 - 1.2 - 0.3125)


## Case

1. Generar geometría, para ello los formatos aconsejados son: fms, ftr y stl. 

   Se opta por el OpenScad y se exporta a STL: 
- *OpenSCAD is a declarative language. In addition, it’s a 3D modeling program based on constructive solid geometry (CSG), which means you’ll never make models with holes in the resulting 3D model mesh. 3 simple categories: shapes (cube, sphere, cylinder), transforms (translate, scale, rotate, mirror), and CSG operations (union, difference, intersection).*
- F5
  `Compiling design (CSG Tree generation)`
- F6
```
Rendering Polygon Mesh using CGAL
Top level object is a 3D object:
   Simple:        yes
   Vertices:       32
   Halfedges:      96
   Edges:          48
   Halffacets:     38
   Facets:         19
   Volumes:         2
```
- Exportar como: <of-dsgn/STL/canalChimney.stl>


2. Definir los contornos desde Blender:

- [SwiftSnap and SwiftBlock, GUIs for OpenFOAM's meshers](https://www.cfd-online.com/Forums/openfoam-meshing/100604-swiftsnap-swiftblock-guis-openfoams-meshers-2.html):

  This swiftBlock is compatible with v 2.62

- Importar STL.

- Seleccionar caras desde el modo edición con RMB (`shift+ctrl+alt+F` para seleccionar todas las caras del mismo plano de la superficie) 
  exportar en diferentes stl.

- 23 boundary

atmosphere
canalback
canalbot
canalfront
canalright
columnback
columnfront
columnleft
columnright
columntop
depoback
depobot
depofront
depoleft
deporight
outlet
outletback
outletfront
outletleft
outletright
wallbot

- Guardar el contenido en un solo fichero STL "canalOWC". Se debe ordenar de forma que queden sólidos cerrados.

- Para comprobar si el modelo es correcto: `surfaceCheck canalOWC.stl`.

  Surface is not closed since not all edges connected to two faces

### 3. Prueba

Canal3D-modelo-ensayo (ref. elbow):

- Geometría generada con openscad `modelo-ensayo.stl`

- Contornos (atmosphere, outflow, allwall) generados mediante Blender, exportados y juntados en un sólo fichero <./canal3D.stl>.

- Comprobación del modelo: `surfaceCheck canal3D.stl`.

  Surface is closed. All edges connected to two faces.

- Preparación de estructura de ficheros para el **mallado**:

  - system
    - controlDict: 0-12; dT 0.01; wI 3.
    - fvSchemes
    - fvSolution
    - meshDict: 
      - maxCS 	0.02
      - boundaryCS 0.0125
      - minCS 0.00991[*hasta aquí si funciona pero no se refina suficiente la salida]
      - localRef {outlet - cS 0.0002 - //refiThick 2.5} [*funciona, la salida se refina bastante bien, pero en la atmosphere refi raro. Se añade una carpeta en polyMesh>sets> nonalignedEdges]
      - boundLayers { 3 - 1.2 - 0.3125) [*se añaden solo en atmosphere]
  - constant
  - 0
  - "Runmesh"
  - "Cleanmesh"
  - "canal3D.stl"


### 4. Prueba

maxCS 0.009

bCS 0.0125

minCS 0.00199

checkesd failed

###5. Prueba
maxCS 0.002
minCS 0.0002
renameBoundary

- Preparación y estructura de ficheros para el **caso**:
  - system:
    - controlDict
    - fvSchemes
    - fvSolution
    - setFieldsDict
  - constant:
    - g; tansportProperties; turbulenceProperties.
    - polyMesh: copiar los ficheros generados al ejecutar el mallado.
  - 0:
    - alpha.water; alpha.water.orig; epsilon; k; nut; nuTilda; p_rgh; U.
  - "Allclean"
  - "Allrun"

### 6. Prueba
maxCS 0.02 (no se malla la chimney)

### 7. Prueba

[Meshing with cfMesh](https://curiosityfluids.com/category/cfmesh/)
maxCellSize 0.2;
Set up refinement zones:
```
objectRefinements
{
 box1
 {
    cellSize 25e-3;
    type box;
    centre (2.4 0 6.5);
    lengthX 1;
    lengthY 1;
    lengthZ 3.5;
 }
box2
 {
    cellSize 5e-3;
    type box;
    centre (2.4 0 7);
    lengthX 0.5;
    lengthY 1;
    lengthZ 2;
 }
}
```
Set up boundaries to be renamed:
```
renameBoundary
{
 newPatchNames
 {
 volume_0
 {
 newName ground;
 type wall;
 }
 volume_1
 {
 newName back;
 type wall;
 }
 volume_2
 {
 newName inlet;
 type patch;
 }
 volume_3
 {
 newName front;
 type wall;
 }
 volume_4
 {
 newName outlet;
 type wall;
 }
 volume_5
 {
 newName top;
 type patch;
 }
 ahmed
 {
 newName ahmed;
 type wall;
 }
}
```
Set up boundary layering:
```
boundaryLayers
{
 patchBoundaryLayers
 {
 ahmed
 {
 nLayers 10;
 thicknessRatio 1.1;
 maxFirstLayerThickness 5e-3;
 }
 volume_0 
 {
 nLayers 10;
 thicknessRatio 1.05;
 maxFirstLayerThickness 10e-3;
 }
 }
}
```
