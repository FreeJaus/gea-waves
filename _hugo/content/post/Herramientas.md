---
title: "Sofware empleado en cada fase"
keywords: 

publishdate: 2016-01-01
date: 2015-11-30
---

**La dinamica de fluidos computacional** es una de las ramas de la mecanica de fluidos que usa metodos numericos y algoritmos para estudiar y analizar problemas que involucran fluidos en movimiento, mediante la solucion de las ecuaciones de Navier-Stokes, transferencia de calor e incluso otras (reacciones quimicas) en el ordenador. Existen diferentes metodos numericos y algoritmos que resuelven de distinta forma las ecuaciones fundamentales.

 -[Una moderna herramienta para el estudio y analisis de fluidos](http://docplayer.es/720690-Simulacion-de-fluidos-utilizando-computadores-una-moderna-herramienta-para-el-estudio-y-analisis-de-fluidos.html)


##Pre-procesado 
---

###Diseño

El modelo se define a partir de un programa de CAD, puesto que la situacion mas comun sera la de disponer del diseño del objeto donde lo que interese sea analizar su comportamiento e interactuacion respecto a las condiciones del flujo. 

De entre las diferentes alternativas (Autodesk AutoCAD, CATIA, NX, Sketchup, SolidEdge, LibreCAD, FreeCAD, ...) se opta por el OpneSCAD, dado que ofrece una interfaz minima y un conjunto limitado de funciones primitivas para generar solidos de forma parametrica. Evitando errores de superficies mal conectadas

 - [OpenSCAD cheat sheet](www.openscad.org/documentation.html)
 - [How to use OpenSCAD](http://www.tridimake.com/2014/11/howto-openscad-iteration-extrusion.html)

OpenFOAM acepta la generacion de la malla mediante una variedad amplia de aplicaciones (mesh generators and CAD systems), con una orden directa ejecutada desde la terminal. La tabla de software para los que se dispone la conversion de la malla estan enunciados en el siguiente enlace: 

 - [Mesh converters](http://www.openfoam.org/features/mesh-conversion.php)
 
 - Generacion de la malla con snappyHexMesh
http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1520005.4
https://sites.google.com/site/snappywiki/snappyhexmesh/snappyhexmeshdict#TOC-geometry
 
 - Netgen
what is-> http://www.asc.tuwien.ac.at/~schoeberl/wiki/index.php/Netgen
http://www.vmtk.org/tutorials/NetgenWay.html

NGSolve Manual-> https://www.math.uzh.ch/compmath/fileadmin/user/stas/compmath/Abschlussarbeiten/Arnold_Noam/myManual.pdf

http://www.netgen-toolbox.org/netgen_usermanual.pdf

 - Salome
http://www.calumdouglas.ch/openfoam-example-3d-dambreak/   + video (de m�s abajo)

http://www.cfd-online.com/Forums/openfoam-meshing-open/73971-mesh-conversion-salome-openfoam.html

http://www.cfd-online.com/Forums/openfoam-meshing-open/76222-boundary-conditions-mesh-exporting.html

https://www.youtube.com/watch?v=1zQbU-E4k1U




##Procesado
---
gitHub
OpenFOAM
IHFOAM
SU2

##Post-procesado
---

 - ParaView
http://www.kitware.com/blog/home/post/578
http://www.kitware.com/blog/home/post/573

*www.bu.edu/tech/support/research/training-consulting/online-tutorials/paraview/

*http://web.student.chalmers.se/groups/ofw5/Basic_Training/ofPostProcessingLucchini.pdf

 - gnuplot
 http://gnuplot.sourceforge.net/demo/
http://gnuplot.sourceforge.net/demo_4.2/
http://gnuplot-tricks.blogspot.nl/
http://stackoverflow.com/questions/18265754/any-graph-plotting-tool-better-than-gnu-plot


