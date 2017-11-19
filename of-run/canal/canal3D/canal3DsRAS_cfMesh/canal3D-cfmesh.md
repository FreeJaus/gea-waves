# Diccionarios requeridos

El proceso de mallado está determinado en el diccionario <./system/meshDict>. For parallel meshing (MPI), <system/descomposeParDict>, y el número de nodos usados para la ejecución en paralelo deberá corresponder al *numberOfSubdomains* en **descomposeParDict**.

El volumen de malla resultante se escribe en el directorio <constant/polyMesh>.

Estructura del caso:

- 0: vacio
- constant: vacio
- system:
  - fvSchemes
  - fvSolution
  - controlDict
  - meshDict

# Procedimiento

Ejecutar por separado la malla y el caso.

## Mesh

### 1. Prueba

Tomando como referencia el caso "singleOrifice" y canal3D:

- 0: vacio
- constan: vacio
- system: fvSchemes, fvSolution, controlDict, meshDict
  - meshDict: sólo entradas requeridas **surfaceFile** y **maxCellSize**.
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

1. Generar geometría desde OpenScad y exportar a STL: 
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
- *OpenSCAD is a declarative language. In addition, it’s a 3D modeling program based on constructive solid geometry (CSG), which means you’ll never make models with holes in the resulting 3D model mesh. 3 simple categories: shapes (cube, sphere, cylinder), transforms (translate, scale, rotate, mirror), and CSG operations (union, difference, intersection).*


Exportar como, <CASECANAL/openscad/stl/canalOWCrect.stl>

3. Definir los contornos desde Blender
- Importar STL
- Seleccionar caras desde el modo edición con RMB (shift+ctrl+alt+F para seleccionar todas las caras del mismo plano de la superficie) 
  exportar en diferentes stl
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

- Guardar el contenido en un solo fichero STL "canalOWC". Se debe ordenar de forma que queden sólidos cerrados
- `surfaceCheck canalOWC.stl`: 
  Surface is not closed since not all edges connected to two faces

- Addon Blender:
  Mesh: 3D Print Toolbox
  Mesh: Bsurfaces GPL Edition
  Mesh: Custom Normals Tools
  Add Mesh: Extra Objects

(shift A) menu para crear vértices, ...
N para abrir menu 

* [SwiftSnap and SwiftBlock, GUIs for OpenFOAM's meshers](https://www.cfd-online.com/Forums/openfoam-meshing/100604-swiftsnap-swiftblock-guis-openfoams-meshers-2.html)

  This swiftBlock is compatible with 2.62

### 3. Prueba

Canal3D-modelo-ensayo

- Geometría generada con openscad `modelo-ensayo.stl`

- Contornos (atmosphere, outflow, allwall) generados mediante Blender, exportados y juntados en un sólo fichero <./modelo-ensayo.stl>.

- Preparación de estructura de ficheros para el mallado:

  - system
    - controlDict: 0-12; dT 0.01; wI 3.
    - fvSchemes
    - fvSolution
    - meshDict: 
      - maxCS 	1.25
      - boundaryCS 0.625
      - minCS 0.2
      - localRef {outlet - cS 0.625 - refiThick 2.5}
      - boundLayers { 3 - 1.2 - 0.3125)
  - constant
  - 0
  - "Runmesh"
  - "Cleanmesh"
  - "modelo-ensayo.stl"

- Preparación y estructura de ficheros para el caso:

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

  ​

  ​