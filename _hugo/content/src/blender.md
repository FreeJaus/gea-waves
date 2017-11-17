- Addon Blender 2.78:
Mesh: 3D Print Toolbox
Mesh: Bsurfaces GPL Edition
Mesh: Custom Normals Tools
Add Mesh: Extra Objects



[Blender](https://openfoamwiki.net/index.php/Blender)
=========
GNU GPL



* [SwiftSnap and SwiftBlock, GUIs for OpenFOAM's meshers](https://www.cfd-online.com/Forums/openfoam-meshing/100604-swiftsnap-swiftblock-guis-openfoams-meshers-2.html)

This swiftBlock is compatible with 2.6x OF240


- Boundaries

* Faces
* Nolmals
* Boundaries
tendran que ser tantas como normales

---

`shift A` menu para crear vértices, etc.
`N` para ocultar o activar la columna de edición que permite manipular numéricamente la posición.

---

- [Opening and repairing a 3d model (stl) file in Blender](https://its.yale.edu/how-to/article-opening-and-repairing-3d-model-stl-file-blender)

Al exportar el modelo desde OpenScad, se tiene una malla triangulada gruesa. Si se añaden vértices y caras nuevas al modelo, es conveniente comprobar el modelo, para ello:

Se activa el complemento "3D Printing" y se selecciona `CheckAll`, en caso de tener caras mal conectadas o agujeros:

click the `Isolated` button
click the `Non-Manifold` button

---

- [how do I triangulate a model/mesh?](https://blenderartists.org/forum/showthread.php?445-how-do-i-triangulate-a-model-mesh)

In edit mode, select all faces you need to triangulate, and then press CTRL-T. To "un" triangulate them, you can press ALT-J. 

---

- [normals display in blender](http://sugarandcyanide.com/blog/2013/01/01/normals-display-in-blender-2-6x/)

Desde el modo edición, teclear `N` para activar el panel de edición y en la categoría "Mesh Display" puede activarse la visualización de las normales a las caras o a los vértices y modificar el tamaño de estas. 

---

- [Invert face's normal direction](https://blenderartists.org/forum/showthread.php?159782-Invert-face-s-normal-direction)

ctrl-n (recalculate outside) ctrl-shift-n (recalculate inside).
Or, just to flip the normals (since recalculation isn't always correct on planes), w -> Flip Normals. 

Pestaña "Sheading/ UVs
Normals: 
Recalculate
Flip Direction

