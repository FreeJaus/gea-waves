# canal3D snappy 
- Diseñar modelo desde OpenSCAD y exportar a stl.
- Blender para generar los contornos (atmosphere, outflow, allwall), unir en un solo fichero los contornos exportados.
- Generar malla base con blockMeshDict.

---
A la hora de diseñar la malla base para snappyHexMesh, debe generarse un bloque mayor que el modelo a "tallar", y es recomendable que la proporción del mallado sea 1:1:1. De lo contrario, la convergencia del algoritmo es más lenta, y puede llegar a error, tal como se indica en [cfd.direct/openfoam/user-guide/snappyHexMesh](http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1540005.4.2).

Para conocer el tamaño del volumen del modelo, se puede utilizar la utilidad `surfaceCheck Name.stl`

El margen entre el modelo y la malla de base se definirá de 25 mm.

- P1: anchura de celdas (0.002 0.002 0.002)m
  (915 346 143)

  Error, no se genera la malla

- P2: (0.005 0.002 0.005)

  (366 346 57)

  nCells: 7218252

  Al ejecutar snappy el cilindro no queda bien.


- P3: (0.002 0.002 0.005)
  (915 346 57) 

  Error

- P4: (0.002 0.002 0.005)

  (915 346 57)  simpleGrading (0.1 0.5 10)

          i : 0.00511178 .. 0.000511178
          j : 0.00276826 .. 0.00138413
          k : 0.00127442 .. 0.0127442
  Error

- P5: anchura de celdas 1,953mm

  Error

---

