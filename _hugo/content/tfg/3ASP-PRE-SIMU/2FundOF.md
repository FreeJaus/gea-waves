[Install OpenFOAM](https://openfoamwiki.net/index.php/Installation/Linux/OpenFOAM-3.0.x/Fedora)

OpenFOAM (Open Field Operation And Manipulation), código CFD robusto y avanzado, ampliamente usado en la industria. 

- Las fuentes son libres y abiertas, con lo que está disponible sin costes de licencia y se puede modificar y adaptar el código. 
- Está orientado a objetos, con estructura modular que facilita programar nuevos resolvedores, condiciones de entorno y la compatibilidad con diversas aplicaciones, no siendo necesaria una profundización extensa en la amplitud del código.
- Las librerías están escritas en lenguaje C++, por ello se requieren unos conocimientos básicos de programación. 
- Preparado para correr los casos en paralelo, mediante métodos de cálculo fáciles de establecer y de calcular, manejando por sí la descomposición del proceso y la reconstrucción final.
- Está diseñado para resolver problemas complejos, soportando fluidos en dos fases con variedad de modelos de turbulencia (Ej. Modelo RAS (Reynolds-Averaged Stress), LES (Large-Eddy Simulation), k-w SST(Shear Stress Transport)).
- Al igual que la mayoría de los programas para el análisis computacional de la Mecánica de Fluidos, usa una discretización de volúmenes finitos. Este método describe cada fase con la fracción **alfa** (alfa=1 todo agua, alfa=0 aire) por el volumen ocupado del fluido en cada celda.
- Para el preproceso y postproceso se pueden utilizar aplicaciones para las cuales existen órdenes directas de conversión listadas en la Guía de Usuario. 
- Además, se añade el paquete de Thitd Party, el cual implementa el programa **ParaView**, software principal usado para el postproceso. 

##2.1 Estructura de un caso

Un caso es un conjunto de carpetas y archivos que definen un problema específico de ingenieria y la forma en que se va a resolver. La esturctura mínima de ficheros necesaria para poder solucionar un fenómeno es: `constant`, `system` y `0` (una carpeta temporal inicial). Esta última no tiene porque corresponder con el tiempo 0 ya que el caso puede ser una parte de un proceso que haya sido simulado previamente.

Dependiendo del tipo de solver y del tipo de problema a tratar se necesitará una mayor o menor cantidad de archivos auxiliares.

En **system** se incluyen archivos relacionados con el proceso de resolución: *blockMeshDict* (contiene información sobre el modelo y los contornos), *controlDict* (es donde se establecen los parámetros relacionados con el tiempo de resolución, paso del tiempo, o funciones para resolver los campos de variables específicaspor cada iteración), *fvSchemes*(describe los esquemas numéricosutilizados para resolver el sistema de ecuaciones), y *fvSolution* (determina cómo se solucionarán las ecuaciones contenidas en fvSchemes, qué método de acoplamiento/algoritmo se emplea, así como, el esquema para la solución de las variables a calcular y las tolerancias).

En el directorio **constant** se encuentran los ficheros donde se describen las propiedades físicas de los flujos (diccionario *transportProperties*), fuerzas exteriores (*g*) y los modelos de turbulencia (*turbulenceProperties*).

//

##2.2 Métodos numéricos: [fvSchemes](http://cfd.direct/openfoam/user-guide/fvschemes/) y [fvSolution](http://cfd.direct/openfoam/user-guide/fvSolution/#x20-1450004.5.1)

Esquema para la integración de tiempo:

- `steadyState`: establece las derivadas del tiempo a cero.
- `Euler`: transitorio, implicito de primer orden, estable.
- `backward`: transitorio, implicito de segundo orden, potencialmente inestable.
- `CrankNicholson`: tramsitorio, implicito de segundo orden, estable.

Esquemas de interpolación, gradiente, divergencia y Laplacianos:

- `linear`: Second order central difference.
- `cubic`: Fourth order central difference.
- `upwind`: First order upwind.
- `linearUpwind`: First/second order upwind.

Solvers lineales:

- `PCG/PBiCG`: Preconditioned (bi-)conjugate gradient, PCG para mallas simétricas, PBiCG para mallas asimétricas.
- `smoothSolver`: Emplea un refinado (ej. Gauss-Seidel).
- `GAMG`: Generalised geometric-algebraic multi-grid.

Modelado de turbulencia:

- `kEpsilon`: modelo estandar de turbulencia para flujos incompresibles y compresibles.
- `kOmegaSST`
- `LESModel`


##2.3 Condiciones de contorno

Las condiciones de contorno (BCs) tienen que ser definidas para cada una de las variables del flujo (U, p, k, etc). Algunos de los tipos de condiciones de contorno soportados por OpenFOAM son:

- **Tipos base**: patch, wall, symmetry, empty, cyclic.
- **Tipos primitivos**: fixedValue, fixedGradient, mixed.
- **Tipos derivados**: calculated inletOulet, outletInlet, movingWallVelocity,slip.

##2.4 Control del tiempo

- **startFrom**:  Controla el tiempo de comienzo de la simulación.
  - `firstTime`: Paso del tiempo más temprano del conjunto de directorios de tiempo.
  - `startTime`: El tiempo se especifica por la entrada *startTime*
  - `latestTime`: Paso del tiempo más reciente desde el conjununto de directorios de tiempo.
- **startTime**:  Comienzo de la simulación con `startFrom startTime`.
- **stopAt**:  Controla el tiempo de finalización de la solución.
  - `endTime`: El tiempo se especifica con la entrada *endTime*
  - `writeNow`: Detiene la simulación al completar el paso del tiempo actual y escribe los datos.
  - `noWriteNow`: Detiene la simulación al completar el paso del tiempo actual pero no escribe los datos.
  - `nextWrite`: Detiene la simulación al completar el próximo tiempo de escritura programado, especificado por el diccionario *writeControl*.
- **endTime**:  El final de la simulación se da cuando `stopAt endTime`.
- **deltaT**:  Paso del tiempo de la simulación.




##2.5 Códigos de resolución

OpenFOAM soporta muchos solvers previamente ya compilados y listos para ser usados. Los solvers más importantes y utilizados son:

- laplacianFoam: Resuelve una ecuación de Laplace simple, por ejemplo, de difusión térmica.
- potentialFoam: Solver de flujo potencial.
- scalarTransportFoam: Resuelve una ecuación de transporte para un escalar pasivo.
- icoFoam: Solver transitorio para flujo laminar e incompresible.
- simpleFoam: Solver estacionario para flujo turbulento e incompresible.
- pimpleFoam: Solver transitorio para flujo incompresible de paso de tiempo elevado que usa el algoritmo PIMPLE (combinación de PISO-SIMPLE).
- pisoFoam: Solver transitorio para flujo turbulento e incompresible.
- sonicFoam: Solver transitorio para flujo sónico de un gas compresible.
- interFoam: Para flujo incompresible de dos fases, usando el método VOF.
- dnsFoam: Simulación numérica directa de turbulencia isotrópica.
- electrostaticFoam: Solver para electrostática.


//

## Pasos para resolver un problema CFD

### Geometría del caso

En OpenFOAM el mallado se carga a través de la orden [blockMesh](http://cfd.direct/openfoam/user-guide/blockMesh/#x25-1420005.3) o [snappyHexMesh](http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1520005.4). La primera opción, resulta sencilla de interpretar y de manipular cuando se trata de  geometrías sencillas; pero cuando los diseños se vuelven algo más complejos se suele utilizar la segunda opción. Esta última opción implica la adición de un fichero, ubicado en <./constant/triSurface/>, el cual contenga la geometría del modelo en STL (STereo Lithography).

Estas órdenes leen el diccionario correspondiente, ubicado en <./system>, el cual determina la geometría del dominio computacional a estudiar, mediante la definición de los vértices, caras, celdas, bloques y contornos del caso. Su funcion principal es la descomposición del dominio en sus tres ejes por hexaedros.

Adicionalmente, existen otras muchas opciones para realizar el mallado a través de diferentes programas que luego OpenFOAM podrá reconocer. La lista de los softwares, que cuentan con una orden directa para ser exportados, se encuentran en la [tabla de conversión](http://www.openfoam.org/features/mesh-conversion.php) de malla. 

### Propiedades físicas del fluido

La información acerca de la viscosidad cinemática y densidad de los fluidos presentes en el caso se determinan en el fichero <./constant/transportProperties>.

Por otro lado, las fuerzas exteriores que intervienen en este problema, en este caso la gravedad, se define en <./constant/g>, con una dirección negativa en la componente *y*.

Así mismo, el modelo de turbulencia para el caso se implementa en el diccionario <./constant/turbulenceProperties>, pueden ser:

1. laminar: no usa modelo de turbulencia;
2. RAS: Reynolds-averaged simulation;
3. LES: Large eddy simulation.

Se simulará el caso con los dos primeros, dado que son los más usuales en este tipo de problemas. 

Para el modelo RAS se requerirán las siguientes entradas:

- `RASModel`: nombre del modelo de turbulencia RAS.
  Para este caso se utiliza, `kEpsilon`, modelo estandar de turbulencia para flujos incompresibles y compresibles, incluyendo la teoría de distorsión rápida (rapid distortion theory, RDT) por el que se basa el término de compresión (based compression term).
- `turbulence`: activar la resolución del modelamiento de la turbulencia.
- `printCoeffs`: devolver por terminal los coeficientes del modelo al comienzo de la simulación.
- `<RASModel>Coeffs`: diccionario opcional de coeficientes para el respectivo modelo RAS, para sobrescribir los coeficientes por defecto.

### Condiciones inciales y de contorno

Las condiciones se establecen en la carpeta <./0>, la cual contiene las  condiciones de contorno e iniciales de todas las variables primarias que intervienen en el problema físico, así como sus respectivas magnitudes.

La definición de los contornos es un tema bastante complejo porque su papel en el modelado no consiste simplemente en el modelado de una entidad geométrica, sino en una parte integral de la solución a través de las condiciones de contorno o "conexiones" inter-fronterizas.

Para ver la lista completa de los tipos disponibles en OpenFoam: <src/finiteVolume/fields/fvPatchFields/constraint>

- Para “alpha.water” se especifica el tipo `zeroGradient` en todas las áreas, para expresar un valor nulo en el gradiente de la componente normal a la pared, salvo para la parte superior (atmosphere) para la cual se determina la condición `inletOutlet`, que se trata de una derivación de `mixes`, la cual cambia entre `zeroGradient` cuando el fluido fluye fuera del dominio por una cara, y `fixedValue`, cuando el fluido entra en el dominio.
- Para la “p” se utiliza el tipo `fixedFluxPressure`, esta condición de contorno se usa cuando hay zonas `zeroGradient`, y donde las fuerzas del cuerpo, como la gravedad y la tensión superficial están presentes en las ecuaciones de la solución. Para la atmósfera, se usa una combinación de la condición `totalPressure` para la presión y `pressureInletOutletVelocity` para la velocidad, donde la velocidad del flujo de entrada es desconocida, pero la presión es conocida.
- Para la “U” se selecciona una condición `noSlip` para todas las paredes, donde la componente normal será cero.
- Los parámetros de la turbulencia, como "k" o "epsilon", también se definen en esta carpeta. Las paredes, típicamente, se definen como `WallFunction`, y para la atmosfera se utiliza el tipo `inletOutlet`, especificando un valor uniforme inicial. Para verificar las propiedades de turbulencia, se puede utilizar la calculadora de [turbulencia CFD](http://www.cfd-online.com/Tools/turbulence.php) en línea.

En este caso se agrega el diccionario <./system/setFieldsDict>, con el cual se introcuce el volumen ocupado por el agua en el instante inicial. Hay diferentes formas de determinar esta geometría, para el caso a estudio se usa `boxToCell` un bloque definido por una diagonal. Se recomienda que las dimensiones sobrepasen el dominio en las zonas donde el agua ocupe el volumen hasta la pared, ya que OpenFoam solo calculará la fracción de fase dentro del dominio computacional.

Nota: OpenFOAM siempre opera en 3D, para ejecutar un caso en 2D se debe especificar la condición `empty` en las áreas normales a la dirección del eje para el cual no se requerirá una solución.

### Esquemas de discretización

Ubicado en el directorio <./system>, en este fichero se configuran los esquemas de discretización, en particular el esquema de integración temporal y los esquemas de convección (transporte).

- El esquema de discretización para la primera derivada del tiempo `ddtSchemes`: **Euler**, adecuado para problemas transitorios, implícito de primer orden, estable.
- El siguiente subdiccionario `gradSchemes` contiene los términos gradientes. Se emplea el esquema de discretización más utilizado: **Gauss linear**, Esta entrada especifica la discretización estandar de volúmenes finitos, la integración Gaussiana, la cual requiere la interpolación de los valores centrados en las celdas a los centrados en las caras.
- El subdiccionario `divSchemes` contiene los términos divergentes.
  El tratamiento de los términos advectivos es uno de los mayores retos en CFD numérico y por ello las opciones son más extensas. La forma más usual de los términos advectivos suele ser `div(phi,...)`, donde phi indica generalmente el flujo (volumétrico) de velocidad en las caras de las celdas, para flujos de densidad constante y el flujo másico para flujos compresibles, por ejemplo `div(phi,U)` para la advección de la velocidad, `div(phi,k)` para la energía cinética de la turbulencia, etc.
- El subdiccionario `laplacianSchemes` contiene términos de Laplace. Por ejemplo, el término de difusión de la ecuación del momento, el cual se corresponde con `laplacian(nu,U)`. El esquema de Gauss es la única opción para la discretización y requiere una selección tanto de un esquema de interpolación para el coeficiente de difusión, viscosidad, como de un esquema del gradiente de la normal a la superficie.

### Procedimiento de resolución: fvSolution

En este fichero, ubicado en <./system/fvSolution>, se definen y configuran los resolvedores lineales matriciales para la fracción de fase `alpha`, el campo de velocidades `U` y de presiones `p`.

- Para cada una de estas variables se define el tipo de resolvedor, junto con los parámetros necesarios. El utilizado para la `p` y la `U` es: **PCG** (*preconditioned conjugate gradient*), para matrices simétricas.
- Por otro lado, el precondicionamiento de las matrices viene dado por **DIC** (*diagonal incomplete-Cholesky*), para matrices simétricas.
- Para la fracción de fase se especifica un suavizado `smoothSolver` del tipo `symGaussSeidel`.

Además de los resolvedores lineales, en este fichero se especifica el algoritmo o método de acoplamiento a emplear para hallar los valores para cada campo. En este caso, se usa **PIMPLE**, versión mejorada de PISO (*Pressure Implicit with Splitting of Operators*), combinado con SIMPLE (*Semi-Implicit Method for Pressure- Linked Equations*), permite garantizar la convergencia de las ecuaciones en cada paso del tiempo.

### Parámetros del resolvedor

Las simulaciones descritas en este trabajo, emplean el código `interFoam`, que resolverá las ecuaciones RANS para dos fases incompresibles usando una discretización de volúmenes finitos. Además, con el método VOF (volumen of fluids) cada fase se describe con la fracción de fase para determinar el volumen ocupado por el fluido en cada celda.

Para asegurar una estabilidad numérica y exactitud temoral durante el proceso de convergencia hacia la solución, se requirie un número de Courant inferior a la unidad. La velocidad del flujo varia por el dominio, así que será necesario definir el paso del tiempo para el caso más extremo. El **número de Courant** para una celda se define como:
$$
Co=\frac{\delta t ·|U|}{\delta x}
$$
donde $\delta t$ representa el paso del tiempo, |*U*| la magnitud de la velocidad a través de la celda y $\delta x$ corresponde al tamaño de celda en la dirección de la velocidad.

### Obtención de resultados

A partir de la versión 4 de OpenFOAM, las herramientas para le postprocesamiento vienen unificadas en una única interfaz en línea de comandos (*command line interface*, CLI).  Estas herramientas, descritas en [User-Guide: 6.2.1.1 Field calculation](http://cfd.direct/openfoam/user-guide/post-processing-cli/#x31-2400006.2.3), se encuentran en <$FOAM_ETC/caseDicts/postProcessing> y se pueden listar por terminal con la orden: `postProcess -list`

La funcionalidad de postprocesado incluye procesamiento de datos, visualización de mediciones (p.e. probes, graph plotting), control del caso y ent/sal (I/O) en tiempo de ejecución. Las funciones se puede ejecutar por:

- Postprocesado convencional, el procesamiento de los datos se realiza **después** de haber finalizado una simulación;
- Procesado en tiempo real, el procesamiento de los datos se realiza **durante** la ejecución de una simulación.

Ambas aproximasiones tienen sus ventajas, el postprocesado convencional permite seleccionar cómo analizar los datos después de obtener los resultados. Por otro lado, el postprocesado en tiempo real ofrece una mayor flexibilidad, ya que se tiene acceso a todos los datos almacenados en la base de ejecución, en lugar de sólo en los tiempos escritos durante la simulación. Así mismo, se obtiene mayor nivel de conveniencia, dado que cuando el usuario lo decida podrá obtener los resultados.

En este estudio, se 

Las funciones objeto pueden listarse con la orden `foamList` junto con la opción `-functionObjects`:

`foamList -functionObjects`

....

/--/

OpenFoam permite la salida de valores, de los campos de variables como la velocidad, en tiempo de ejecución, mediante el uso de funciones orientadas a objetos (function objects). Estas funciones pueden introducirse en el fichero ./system/controlDict. También se puede configurar en un fichero aparte, <./system/sampleDict>, y ejecutar desde terminal `sample` para obtener los valores sin volver a ejecutar la simulación.

Existe otra alternativa para obtener los valores en postproceso, mediante la utilidad `probeLocations`, habiendo definido su diccionario asociado en <./system/probesDict>.

Valores de interés: p, SLL, Residuos, Yplus.

/--/

www.bu.edu/tech/support/research/training-consulting/online-tutorials/paraview/

### Simulación en paralelo

OpenFOAM posee cuatro métodos de descomposición:

1. Simple: Descomposición geométrica simple en la cual el dominio es dividido en piezas según la dirección, por ejemplo, 2 piezas en la dirección x, 1 en la y, etc.
2. Hierarchical: Misma que la simple excepto en que el usuario especifica el orden de la división direccional, por ejemplo, primero dirección y, luego en la dirección x etc.
3. Metis: Descomposición que no requiere entrada geométrica por el usuario y que intenta minimizar el número de fronteras entre procesadores.
4. Manual: Descomposición manual, donde el usuario especifica directamente la asignación de cada celda a un procesador particular.
   Para cada método, hay una serie de coeficientes especificados en el diccionario
   decomposeParDict.
   Para realizar una simulación en paralelo la forma más simple sería la siguiente:

```
decomposePar
mpirun −np 2 simpleFoam −parallel
reconstructPar
```

donde ’-np’ indica el número de procesadores a usar.