---
title: "Lista de casos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# CASES

 - **damBreak [single]**: default case, copied from `<$FOAM_RUN/tutorials/multiphase/interFoam/laminar>`. It is thoroughly explained at [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/).
	- Objetivos planteados: 
		- Simular la caida de una columna de agua, haciéndola chocar contra un saliente (colocado en la parte central de la base) lo suficientemente pequeño como para que el volumen de agua lo sobrepase y golpee contra las paredes de un tanque hasta su estabilización. 
		- Analizar el comportamiento de la Superficie Libre de Líquido (SLL), para ello se prestará especial atención al cálculo de la fracción de volumen relativo a las dos fases de flujo en cada celda.
	- Condiciones iniciales: 
		- Caso en 2D, multifásico, laminar, incompresible, Newtoniano.   
		- Mediante la aplicación **"interFoam"** se resuelven las ecuaciones de RANS (Reynold-average Navier-Stokes) para dos fases inmiscibles de flujos y se consigue monitorizar el movimiento de la SLL usando la técnica de Volúmenes Finitos (*Volume of Fluid*, VOF). 
		- La discretización de las ecuaciones se lleva a cabo con el método [MULES](http://www.openfoam.org/version2.3.0/multiphase.php) (Multidimensional Universal Limiter with Explicit Solution) creado por OpenCFD, donde se resuelve la Ecuación de Transporte, determinando la fracción de volumen relativo a las dos fases, o **fracción de fase**, en cada celda (estableciendo como condición inicial para la fracción de fase 1 para la fase de agua y 0 para la fase del aire).
		- Abierto a la atmosfera, permitiendo la entrada y salida del flujo de aire. Usando el método de acoplamiento PIMPLE, se implementa una combinación de condiciones para hallar la presión y la velocidad y se resuelve simultáneamente la continuidad y conservación de momento.
 
 - **damBreakFine [parallel]**: increase the mesh resolution, as explained at [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/). The details of how to run a case in parallel are explained at [User Guide: 3.4 Running applications in parallel](http://cfd.direct/openfoam/user-guide/running-applications-parallel).
	- Objetivos planteados: 
		- Realizar cambios en la geometría del mallado desde el directorio `blockMeshDict`.
		- Correr el caso en paralelo.
	- Condiciones iniciales:
		- La velocidad y la presión se mantienen uniformes, ya que son independientes del número de elementos por capa. 		- Se emplea la utilidad de **descomposePar**, para descomponer el dominio. Como otras utilidades de OpenFOAM, se puede encontrar el directorio asociado en el código fuente `<$FOAM_UTILITIES/parallelProcessing/decomposePar>`.
		- El número de subdominios a especificar suele corresponder con el número de procesadores disponibles. Aunque también se puede determinar en función del dominio, como es el caso, donde el número de subdominios se define con el vector **n**. Será beneficioso conservar el número de celdas por caras colindante con la descomposición.
 
 - **damBreakMod [single]**: hand-modified blockMeshDict to include a topWall, so that a chamber/chimney is created at the right. Use `<meld damBreak damBreakMod>` to check changes.
	- Objetivos planteados: 
		- Modificar la geometría para que se asemeje a la del dispositivo de Columna de Agua Oscilante, añadiendo una pared en la parte derecha, abierta por la parte inferior, para crear una cavidad por donde oscile el agua.
		- Visualizar la altura de la SLL en la cavidad/chimenea. 
	- Condiciones iniciales:
		- Partiendo del caso original, se realizarán cambios en el fichero `blockMeshDict` y en los ficheros afectados por estos cambios (ficheros donde se describen las condiciones de entorno para la presión, velocidad, ... en función de la geometria de los bloques).
		- Suprimir el saliente por no aportar información.   
		
 - **damBreakSwiftBlock [single]**: blockMeshDict generated with SwiftBlock (plugin for Blender available at [GitHub/nogenmyr](https://github.com/nogenmyr/swiftBlock)). There are two models available at [SwiftBlock_cube](of-dsgn/blender/damBreakSwiftBlock_cube.blend) and [damBreakSwiftBlock](of-dsgn/blender/damBreakSwiftBlock.blend). The first one is just a cube. The second resembles the topology of damBreak. On top of that, `<of-dsgn/blender/damBreakModSB.blend>` can be used to create the blockMeshDict for damBreakMod. The summery of steps ejecuted in Blender:
 	1. Scale and translate the cube shown in the default Start-Up File.
  	2. Ctrl+Alt+U and activate SwiftBlock at Addons/OpenFOAM.
  	3. Enable `SwiftBlock settings` at Object Properties.
  	4. Change to `Edit Mode` and pick `Face select`.
  	5. Set patch names and types (rightWall, leftWall, lowerWall, atmosphere). Mind that the default name is `defaultName`, while `defaultFaces` is used in the files copied from damBreak. Front a Rear faces should be assigned to <defaultFaces> to avoid problems.
  	6. Choose `Set edges`, write the name of the object, `<Cube>`, and press Enter.
  	7. In `Edit Mode` select the front face, set <# cells: 40> and press `Force resolution`. Alternatively, resolutions may be set to edges independently. However, consistency must be preserved.
  	8. Click `Diagnose` and, then, `Preview` to verify the resulting mesh.
  	9. Write result to blockMeshDict.
  	
	- Objetivos del caso: 
		- Dividir en bloques la geometría del modelo obtenida a partir de un programa de CAD.
		- Verificar la resolución del caso, a partir de geometrías definidas por el usuario y convertidas a un formato reconocible por OpenFOAM.
	- Condiciones iniciales:
		- Las condiciones iniciales se mantendrán sin cambios del caso anterior; sin embargo, se han de modificar aquellos ficheros que no correspondan con la definición de las capas del modelo definidas en `blockMeshDict`. 
		
 - **damBreak3d [single]**: until analize snappy case (which it needs to be refine in 3 axes) it is interesting to analyze volume of water whitch is defined thinner in z direction to research diferences in three axes. For that, it takes [Calum Duglas explications of damBreak example modified to 3d](http://www.calumdouglas.ch/openfoam-example-3d-dambreak/). The summery of steps are the following: 
	1. Change blockMeshDict (add width in z axes dim=2, increase number of cells as 8 in each block and define fonrtback boundary as wall).
	2. Edit system/setFieldsDict to set new range to the volume of water inside of chamber to be less than 0.292m (in blockMeshDict is defined convert to meters 0.146 so as explained in the reference case the dimensions in boxtocell are in meter whithout any scale).
	
	- Objetivos del caso:
		- Apreciar el colapso del agua en el espacio (x,y,z).
	- Condiciones iniciales:
		- Modificar la geometría del modelo, aumentar la anchura en el eje z y la discretización en dicho eje.
		- Definir la columna de agua añadiendo  el eje z. 
		
>>> SCRIPTS

To run all the cases:

./RunCase damBreak damBreakFine damBreakMod damBreakSwiftBlock

To clean all the case directories:

./CleanCase damBreak damBreakFine damBreakMod damBreakSwiftBlock
