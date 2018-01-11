---
title: "Fuentes de información y herramientas"
keywords: 
weight: 5

publishdate: 2016-01-01
date: 2016-01-01
---

<!--more-->

## Libros
* [3] White F.M.; “Mecánica de fluidos; 6ª edición; Ed.: McGraw-Hill; Madrid 2008.
* [4] Fernández Oro, J.M.; “Técnicas numéricas en ingeniería de fluidos”; Ed.: Reverte; Barcelona 2012.
* [9] Ferziger J.H., Perić M.; "Computational Methods for Fluid Dynamics"; 3rd Edition; Ed.: Springer; New York, 2002.

## Artículos de revista
* [1] Orrego, S; "Simulación de fluidos utilizando computadores: una moderna herraamienta para el estudio y análisis de fluidos"; Grupo de Investigación Mecánica Aplicada; Universidad EAFIT, Colombia; noviembre 2009.
* [2] Amundarain, M. (2012). "La energía renovable procedente de las olas"; Ikastorratza, e-Revista de Didáctica 8, Retrieved 2012/02/25 from http://www.ehu.es/ikastorratza/8_alea/energia/energia.pdf (ISSN:1988-5911).
* [5] Romero García,RE; "Producción de energía eléctrica a partir de los mares"; Técnica Industrial; 288; Agosto 2010; pp 44-51.
* [6] Montero Sousa, JA y Calvo Rolle, JL; "Energía mareomotriz: perspectiva histórica y estado actual"; Técnica Industrial; 301; marzo2013; pp54-60.
* [8] Pelissero, M et al.; "Aprovechamiento de la Energía Undimotriz"; Proyecciones, Vol 9 No. 2, octubre 2011; pp 53-65.

## Web
* [7] "Energía del oleaje"; Eduambiental; pp 515-550. http://comunidad.eduambiental.org/file.php/1/curso/contenidos/docpdf/capitulo22.pdf

## Herramientas
- OpenFOAM:  Software pionero en la creación de códigos libres de CFD. Licencia GPL (General Public Licence), orientado a objetos y de estructura modular.
  - Cuenta con una guía de usuario: http://cfd.direct/openfoam/user-guide/
  - Además de una amplia contribución por parte de la comunidad de ususarios que han utilizado este software: http://www.cfd-online.com/Wiki/OpenFOAM
  - Compatibilidad con variedad de programas para la conversión del mallado: http://www.openfoam.org/features/mesh-conversion.php
    Preparado para correr los casos en paralelo: http://www.openfoam.org/features/parallel-computing.php

- Paraview: Código abierto, multiplataforma (compatible con los Sistemas Operativos más populares, empleado para el análisis de resultados y visulización del movimiento de los fluidos, constrido a partir de VTK: http://www.bu.edu/tech/support/research/training-consulting/online-tutorials/paraview/
  - A partir de esta aplicación, OpenFOAM generó el paquete Parafoam, conteniendo las librerias necesarias: http://cfd.direct/openfoam/user-guide/paraview/#x30-1790006.1

- Docker: Para ejecutar OpenFOAM desde cualquier Sistema Operativo, sin necesidad de instalar permanentemente todo el código: https://www.cfdengine.com/blog/how-to-install-openfoam-anywhere-with-docker/

- OpenSCAD: Ofrece una interfaz minima y un conjunto limitado de funciones primitivas para generar sólidos de forma paramétrica. Evitando errores de superficies mal conectadas.
  - OpenSCAD cheat sheet: www.openscad.org/documentation.html
  - Tutorial: http://www.tridimake.com/2014/11/howto-openscad-iteration-extrusion.html

- Gnuplot: Programa multiplataforma para gráficar funciones y datos, pudiendo producir sus resultados directamente en pantalla, así como en multitud de formatos de imagen: http://www.gnuplot.info/docs_4.6/gnuplot.pdf

- Blender: Herramienta avanzada para el modelado en 3D que permite tanto trabajar con el mallado, como post-procesar los resultados para obtener visualizaciones de calidad profesional. 
  - Existen complementos para combinarlo con OpenFOAM, y generar desde Blender los ficheros de “blockMeshDict” y “snappyHexMeshDict”: https://openfoamwiki.net/index.php/Blender

  - Tutoriales y guía de usuario: https://wiki.blender.org/index.php/Doc:2.4/Tutorials
