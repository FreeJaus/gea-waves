[Mesh generation](http://hmf.enseeiht.fr/travaux/projnum/book/export/html/1467)

OpenFOAM has two native mesh generators: blockMesh and snappyHexMesh. The former is used to generate block-structured grids from vertices defined in blockMeshDict, whereas the later generates 3-dimensional meshes containing hexahedra (hex) and split-hexahedra (split-hex) automatically from triangulated surface geometries in (STL) format.

In order to run snappyHexMesh, the user requires the following:

   - one or more tri-surface files located in a constant/triSurface sub-directory of the case directory;
   - a background hex mesh which defines the extent of the computational domain and a base level mesh density; typically generated using blockMesh, discussed in section 5.4.2.
   - a snappyHexMeshDict dictionary, with appropriate entries, located in the system sub-directory of the case.


To generate the mesh with the snappyHexMesh tool we proceed as follows:

1. Check the dimensions of the geometry before setting the block to define base mesh by blockMesh. Two ways:
- Openning stl geometry in paraview.
- Oppenning OF terminal: `surfaceCheck NAME.stl`.

2. Specify the vertices that define the background mesh, so that it could contain the geometry.

2.1 Set the boundary conditions as they are without changing them, and do the same for blocks, It is not necessary to create a fine background mesh, since it will be refined by snappyHexMesh.

2.2 Then we run: `blockMesh` to generate the hexahedral background mesh. 

3. Modify or create the snappyHexMesh input file. One can create or just modify  snappyHexMeshDict input file in the system sub-directory of the case. This file includes parameters at the top level that control the various stages of the meshing process. 

The process of generating a mesh using snappyHexMesh consists of three stages: 

 - **Cell splitting at feature edges and surfaces**: Start the splitting from locationInMesh feature. This edge must be inside the region to be meshed and must no coincide with a cell, and Splitts the cells around the surface according to *refinementSurfaces*.

- **Snapping to surfaces**: involves moving cell vertex points onto surface geometry to remove the jagged castellated surface from the mesh.

- **Mesh layers addition**: involves shrinking the existing mesh from the boundary and inserting layers of cells.
