# 4 FUNDAMENTOS DE OPENFOAM

## 4.1 INTRODUCCIÓN

OpenFOAM *(Open Field Operation And Manipulation)* es un código para la resolución de problemas CFD en continuo desarrollo, de fuentes abiertas, robusto y avanzado, ampliamente usado en la industria. El paquete incluye módulos para una amplia gama de aplicaciones. Algunas de sus características más relevantes son:

- Las fuentes son libres y abiertas, con lo que está disponible sin costes de licencia y se puede modificar y adaptar el código. 
- Las librerías están escritas en lenguaje C++, orientado a objetos, con estructura modular que facilita programar nuevos resolvedores, condiciones de entorno y la compatibilidad con diversas aplicaciones, no siendo necesaria una profundización extensa en la amplitud del código.
- Preparado para correr los casos en paralelo, mediante métodos de cálculo fáciles de establecer y de calcular, manejando por sí la descomposición del proceso y la reconstrucción final.
- Está diseñado para resolver problemas complejos, soportando fluidos en dos fases con variedad de modelos de turbulencia (Ej. Modelo RAS (Reynolds-Averaged Stress), LES (Large-Eddy Simulation), k-w SST(Shear Stress Transport)).
- Al igual que la mayoría de los programas para el análisis computacional de la Mecánica de Fluidos, usa una discretización de volúmenes finitos. Este método describe cada fase con la fracción alfa (alfa=1 todo agua, alfa=0 aire) por el volumen ocupado del fluido en cada celda.
- Para el preproceso y postproceso se pueden utilizar aplicaciones auxiliares para las cuales existen órdenes directas de conversión listadas en la Guía de Usuario. 
- Además, se añade el paquete de terceros (*Thitd Party*), el cual implementa el programa ParaView, software principal usado para el postproceso. 



## 4.2 TRAYECTORIA DE OPENFOAM

FOAM fue escrito por Henry Weller, entre otros, en el Imperial Collage en 1989. Entre los años 2000-2004 FOAM fue un código comercializado por la compañía Nabla Ltd. No obstante, en 2004 decidieron lanzar el código bajo licencia GPL con el nuevo nombre de OpenFOAM. Este se distribuyó por OpenCFD durante varios años, pero en 2011 SGI compró OpenCFD. Poco después, en 2012, SGI vendió OpenCFD y la marca OpenFOAM a ESI Group.

Algunos miembros del grupo que desarrollaron FOAM, decidieron crear ["The OpenFOAM Fundation"](http://www.openfoam.org/contrib/) para continuar desarrollando el código, corregir errores, ofrecer cursos y consultorías especializadas. Desde entonces, lanzan una nueva versión cada 6 meses, [Release History](https://openfoam.org/download/history/). Como se ha mencionado, la marca OpenFOAM pertenece a OpenCFD Ltd, pero se la concedieron a la fundación para su uso. Las versiones publicadas, son de alta calidad, comprobadas (*future-proof*) y fáciles de mantener. No obstante, su política de aceptación de contribuciones es bastante estricta, lo que reduce las aportaciones por la comunidad en desarrollos que pudieran estar disponibles e implementados en la distribución. Esto recientemente ha cambiado, más adelante se detalla la estrategia para ofrecer más soporte. 

En cambio [OpenCFD Ltd](https://www.cfd-online.com/Forums/openfoam-news-announcements-opencfd/165324-opencfd-pleased-announce-release-openfoam-v3-0-a.html) tiene su propio ciclo de desarrollo, proporcionando nuevas características, tratando de mantener los mismos estándares.

En 2016, utilizando como base la versión de *OpenFOAM Fundation*, se añadieron nuevas funcionalidades, fruto del desarrollo por clientes de OpenCFD y por la comunidad de OpenFOAM. Esto dió lugar a otra línea de desarrollo del código [OpenFOAM 1606+](http://www.openfoam.com:80/version-v1606+/) ([The way back machine](https://web.archive.org/web/20170622010404/http://www.openfoam.com:80/version-v1606+/)) (YearMonth+, ISO-8601).

El primer indicio de OpenFOAM+ se hizo público, en octubre de 2015, con la versión de OpenFOAM para Windows, y más tarde basado en la línea de desarrollo 3.0, cohexistieron OpenFOAM 3.0 y OpenFOAM 3.0+, lo que confundió a la comunidad [OpenFOAM v3.0+ ??](https://www.cfd-online.com/Forums/openfoam/165322-openfoam-v3-0-a.html) y conllevó a la nueva nomenclatura, mencionada anteriormente. A parte de las explicaciones que se dieron por la comunidad, en el siguiente blog se aclaran las diferentes ramas desarrolladas entorno al programa, [*What is what and who is who in the OpenFOAM environment?*](https://sites.google.com/view/olaflowcfd/blog/old-blog-entries/what-is-what-and-who-is-who-in-the-openfoam-environment). 

![historyOF](imgFBasic/41-historyOF.png)

Figura 4.1: Esquema de la trayectoria del desarrollo del código. [Pablo Higuera 2016]

OpenCFD Ltd (ESI Group) sigue distribuyendo el código gratuitamente bajo licencia GPL. Además, como puede verse entre las novedades, hace no mucho sacaron una nueva versión [Main OpenFOAM News](https://www.openfoam.com/news/), concretamente [31/12/2017 OpenFOAM v1706](https://www.openfoam.com/releases/openfoam-v1706/), la cual cuenta con numerosas contribuciones de:

- [Wikki](http://www.wikki.co.uk/)
- [Creative Fields](https://cfmesh.com/company/)
- [OpenFOAM Fundation](http://openfoam.org)  
- Instituto de Hidráulica Ambiental [IHCantabria](http://www.ihcantabria.com/en/)
- [CFD Software E+F GmbH](http://www.cfd-berlin.com/)


Para que el software de código abierto evolucione y prospere, se necesita de la comunidad. La financiación también es necesaria, por ello desde la Fundación de OpenFOAM se reunen diferentes objetivos dentro del llamado [Mantenimiento de OpenFOAM](https://openfoam.org/news/funding-2018/).

En 2016 se llevó a cabo una campaña que concluyó de forma exitosa para recaudar €100k de fondos para el 2017. Esto sirvió para financiar, mejoras en el código, resolución de informes de errores, paquetes compatibles con sistemas operativos Linux y macOS y el lanzamiento de OpenFOAM v5.

Las actividades mencionadas, forman parte de los costes recurrentes para mantener OpenFOAM entre los estándares más altos y evolucionar en la dirección de las expectativas de los usuarios. Los costes anuales son de aproximadamente €250k incluyendo lo siguiente:

- €80k- Desarrollos entorno a la usabilidad: nuevos códigos, ejemplos de casos y documentación.
- €60k- Rediseño del código: modificando la estructura para integrar nuevos desarrollos.
- €60k- Resolución de errores: anualmente gestionan 500 informes de problemas, resolviendo funcionalidades incorrectas/incompletas.
- €25k- Distribución y comprobaciones: creando casos, ejecutando comprobaciones, compilación del código, lanzamiento de nuevas versiones y promoción.
- €25k- Fase de operación: *marketing* , infraestructura de la web, cumplimiento y aplicación de licencias, finanzas y administración, consultas generales.

![FondosOF](imgFBasic/42-FondosOF.png)

Figura 4.2: Distribución de costes "The OpenFOAM Fundation". [Funding OpenFOAM in 2018](https://openfoam.org/news/funding-2018/)

Para lograr los fondos necesarios para el mantenimiento, en 2018 introdujeron los [Planes de Fondos OpenFOAM](https://openfoam.org/maintenance/). Así, lograron compromisos por parte de [organizaciones de apoyo](https://openfoam.org/supporters/) con la adquisición de estos planes, además, las organizaciones comercialmente dependientes del código (las cuales obtienen ahorros significativos en tarifas de licencias) pueden apoyar su desarrollo y priorizar las solicitudes enviadas. 



## 4.3 INSTALACIÓN DE OPENFOAM

Las instrucciones a seguir para la instalación dependerán del sistema operativo que se vaya a utilizar, principalmente está pensado para distribuciones de Linux, aunque también se incluyen instrucciones para arrancar el programa desde Windows o Mac soportado desde Docker.

A lo largo de los años se han realizado muchas mejoras, se han añadido funcionalidades, se ha reescrito parte del código, etc., por ello es recomendable trabajar con la última versión estable del programa. Además, cabe destacar que progresivamente se ha mejorado el tiempo que conlleva el proceso de instalación.

Durante el transcurso de las simulaciones se ha trabajado con diferentes versiones. No obstante, los cambios necesarios para adecuar un caso de una versión a otra pueden detectarse fácilmente comparando el mismo caso de tutorial mediante alguna herramienta de comparación de archivos (como *WinMerge* o *meld*).

Adicionalmente, si se opta por usar [Docker](https://docs.docker.com/docker-for-windows/), este permite ejecutar desde terminal o desde [portainer](https://github.com/portainer/portainer) un entorno personalizado (comúnmente conocido como un *contenerdor*) que incluye la *imagen* del código, además de herramientas y librerias necesarias para procesar y visualizar el caso. Así mismo, esta herramienta utiliza toda la potencia del ordenador (a partir de la versión de windows 10). 




##4.4 ESTRUCTURA DE UN CASO

Un caso es un conjunto de carpetas y archivos que definen un problema específico de ingenieria y la forma en que se va a resolver. La esturctura mínima de ficheros necesaria para poder solucionar un fenómeno es: `constant`, `system` y `0` (una carpeta temporal inicial). Esta última no tiene porque corresponder con el tiempo *0* ya que el caso puede ser una parte de un proceso que haya sido simulado previamente.

Dependiendo del tipo de solver y del tipo de problema a tratar se necesitará una mayor o menor cantidad de archivos auxiliares.

En **system** se incluyen archivos relacionados con el proceso de resolución: *blockMeshDict* (contiene información sobre el modelo y los contornos), *controlDict* (es donde se establecen los parámetros relacionados con el tiempo de resolución, paso del tiempo, o funciones para resolver los campos de variables específicaspor cada iteración), *fvSchemes*(describe los esquemas numéricosutilizados para resolver el sistema de ecuaciones), y *fvSolution* (determina cómo se solucionarán las ecuaciones contenidas en fvSchemes, qué método de acoplamiento/algoritmo se emplea, así como, el esquema para la solución de las variables a calcular y las tolerancias).

En el directorio **constant** se encuentran los ficheros donde se describen las propiedades físicas de los flujos (diccionario *transportProperties*), fuerzas exteriores (*g*) y los modelos de turbulencia (*turbulenceProperties*).



## 4.5 PASOS PARA RESOLVER UN PROBLEMA CFD

Como ya se ha mencionado, la simulación CFD permite obtener más precisión en los resultados, ofreciendo buenas estimaciones de lo que sucederá en la realidad. Para ello, es muy importante definir adecuadamente los parámetros del caso, así como la *escala de flujo* requerida. Esta escala, está condicionada por la longitud del dominio, la velocidad y el tiempo de simulación. Es decir, se debe retener en el modelo sólo las partes relevantes; si se define bien el dominio la solución convergerá adecuadamente. 

El parámetro adimensional que relaciona estas variables, es el número de Reynolds, si se quisiera aumentar este número, sería necesario bajar la temperatura o aumentar la presión del dominio. A medida que se aumente el número de Re o la escala de flujo, se requerirán más recursos computacionales.

El **teorema de $\pi$ de [Vaschy-Buckingham](https://es.wikipedia.org/wiki/Teorema_%CF%80_de_Vaschy-Buckingham)** es el teorema fundamental del análisis dimensional. El teorema establece que dada una relación física expresable mediante una ecuación en la que están involucradas *n* magnitudes físicas o variables, y si dichas variables se expresan en términos de *k* cantidades físicas dimensionalmente independientes, entonces la ecuación original puede escribirse equivalentemente como una ecuación con una serie de *n-k* números adimensionales construidos con las variables originales. Este teorema explica que si se quisiera realizar una simulación a escala, sin cambiar la temperatura ni la gravedad, las dimensiones también deberían ser iguales, luego físicamente no tendría sentido.



###4.5.1 Preproceso



####4.5.1.1 Geometría del caso

En OpenFOAM el mallado se carga a través de la orden [blockMesh](http://cfd.direct/openfoam/user-guide/blockMesh/#x25-1420005.3) o [snappyHexMesh](http://cfd.direct/openfoam/user-guide/snappyHexMesh/#x26-1520005.4). La primera opción, resulta sencilla de interpretar y de manipular cuando se trata de  geometrías sencillas; pero cuando los diseños se vuelven algo más complejos se suele utilizar la segunda opción. Esta última opción implica la adición de un fichero, ubicado en <./constant/triSurface/>, el cual contenga la geometría del modelo en STL (STereo Lithography).

Las órdenes, ejecutadas por terminal, leen el diccionario correspondiente, ubicado en <./system/blockMeshDict> o <./system/snappyHexMeshDict>, el cual determina la geometría del dominio computacional a estudiar, mediante la definición de los vértices, caras, celdas, bloques y contornos del caso. Su funcion principal es la descomposición del dominio en sus tres ejes por hexaedros.

OpenFOAM siempre opera en 3D, para ejecutar un caso en 2D se debe especificar la condición `empty` en las áreas normales a la dirección del eje para el cual no se requerirá una solución.

Adicionalmente, existen otras muchas opciones para realizar el mallado a través de diferentes programas que luego OpenFOAM podrá reconocer. La lista de los softwares, que cuentan con una orden directa para ser exportados, se encuentran en la [tabla de conversión](http://www.openfoam.org/features/mesh-conversion.php) de malla. 



####4.5.1.2 Propiedades físicas

La información acerca de la viscosidad cinemática (*nu*) y densidad (*rho*) de los fluidos presentes en el caso se determinan en el fichero <./constant/transportProperties>. Las dimensiones de las variables se expresan de la forma explicada en [User Guide: 4.2.6 Dimensional units](https://cfd.direct/openfoam/user-guide/basic-file-format/#x17-1290004.2.6).

Por otro lado, las fuerzas exteriores que intervienen en este problema, en este caso la gravedad, se define en <./constant/g>, con una dirección negativa en la componente *y*.



####4.5.1.3 Modelado de la turbulencia

El modelo de turbulencia para el caso se implementa en el diccionario <./constant/turbulenceProperties>, pueden ser:

1. laminar: no usa modelo de turbulencia;
2. RAS: Reynolds-averaged simulation;
3. LES: Large eddy simulation.

En este estudio se simulará el caso con los dos primeros, dado que son los más comunes en este tipo de problemas. Como el modelo consta de una pared contra la que el agua colisionará, el modelo RAS ofrecerá una mayor aproximación a la realidad. Para este modelo se requerirán las siguientes entradas:

- `RASModel`: nombre del modelo de turbulencia RAS.
  En los casos que se simularán se implementa `kEpsilon`, modelo estandar de turbulencia para flujos incompresibles y compresibles, incluyendo la teoría de distorsión rápida (rapid distortion theory, RDT) por el que se basa el término de compresión (*based compression term*).
- `turbulence`: activar la resolución del modelamiento de la turbulencia.
- `printCoeffs`: devolver por terminal los coeficientes del modelo al comienzo de la simulación.
- `<RASModel>Coeffs`: diccionario opcional de coeficientes para el respectivo modelo RAS.




####4.5.1.4 Condiciones inciales y de contorno

Las condiciones se establecen en la carpeta <./0>, la cual contiene las  condiciones de contorno e iniciales de todas las variables primarias que intervienen en el problema físico, así como sus respectivas magnitudes.

La definición de los contornos es un tema bastante complejo porque su papel en el modelado no consiste simplemente en el modelado de una entidad geométrica, sino en una parte integral de la solución a través de las condiciones de contorno o "conexiones" inter-fronterizas.

Para ver la lista completa de los tipos disponibles en OpenFoam: <src/finiteVolume/fields/fvPatchFields/constraint>

- Para “alpha.water” se especifica el tipo `zeroGradient` en todas las áreas, para expresar un valor nulo en el gradiente de la componente normal a la pared, salvo para la parte superior (atmosphere) para la cual se determina la condición `inletOutlet`, que se trata de una derivación de `mixes`, la cual cambia entre `zeroGradient` cuando el fluido fluye fuera del dominio por una cara, y `fixedValue`, cuando el fluido entra en el dominio.
- Para la “p” se utiliza el tipo `fixedFluxPressure`, esta condición de contorno se usa cuando hay zonas `zeroGradient`, y donde las fuerzas del cuerpo, como la gravedad y la tensión superficial están presentes en las ecuaciones de la solución. Para la atmósfera, se usa una combinación de la condición `totalPressure` para la presión y `pressureInletOutletVelocity` para la velocidad, donde la velocidad del flujo de entrada es desconocida, pero la presión es conocida.
- Para la “U” se selecciona una condición `noSlip` para todas las paredes, donde la componente normal será cero.
- Los parámetros de la turbulencia, como "k" o "epsilon", también se definen en esta carpeta. Las paredes, típicamente, se definen como `WallFunction`, y para la atmosfera se utiliza el tipo `inletOutlet`. Para verificar las propiedades de turbulencia, se puede utilizar la calculadora de [turbulencia CFD](http://www.cfd-online.com/Tools/turbulence.php) en línea.

En este caso se agrega el diccionario <./system/setFieldsDict>, con el cual se introcuce el volumen ocupado por el agua en el instante inicial. Hay diferentes formas de determinar este volumen, para el caso a estudio se usa `boxToCell` un bloque definido por una diagonal. Se recomienda que las dimensiones sobrepasen el dominio en las zonas donde el agua ocupe el volumen hasta la pared, ya que OpenFoam solo calculará la fracción de fase dentro del dominio computacional.



####4.5.1.5 Esquemas de discretización:

Ubicado en el directorio <./system/>, en el fichero [fvSchemes](http://cfd.direct/openfoam/user-guide/fvschemes/) se configuran los esquemas de discretización, en particular el esquema de integración temporal y los esquemas de convección (transporte).

Esquema para la integración de tiempo:

- `steadyState`: establece las derivadas del tiempo a cero.
- `Euler`: transitorio, implicito de primer orden, estable.
- `backward`: transitorio, implicito de segundo orden, potencialmente inestable.
- `CrankNicholson`: transitorio, implicito de segundo orden, estable.

Esquemas de interpolación, gradiente, divergencia y Laplacianos:

- `linear`: Diferencia central de segundo orden (*second order central difference*).
- `cubic`: Diferencia central de cuarto orden (*Fourth order central difference*).
- `upwind`: "*upwind*" de primer orden (*First order upwind*).
- `linearUpwind`: "*upwind*" de primer/segundo orden (*First/second order upwind*).



####4.5.1.6 Procedimiento de resolución:

En el fichero [fvSolution](http://cfd.direct/openfoam/user-guide/fvSolution/#x20-1450004.5.1), ubicado en <./system/>, se definen y configuran los resolvedores lineales matriciales para la fracción de fase *alpha*, el campo de velocidades *U* y de presiones *p*:

- `PCG/PBiCG`: Preconditioned (bi-)conjugate gradient, PCG para mallas simétricas, PBiCG para mallas asimétricas.
- `smoothSolver`: Emplea un refinado (ej. Gauss-Seidel).
- `GAMG`: Generalised geometric-algebraic multi-grid.

Además de los resolvedores lineales, en este fichero se especifica el algoritmo o método de acoplamiento a emplear para hallar los valores para cada campo (SIMPLE, PISO o PIMPLE). 



###4.5.2 Proceso



#### 4.5.2.1 Control del tiempo

Los parámetros, como el tiempo que tarda en leer y escribir una solución,  se determinan en <./system/controlDict>. El parámetro adimensional del número de Courant relaciona, el paso del tiempo, la velocidad del flujo por una celda y el tamaño de la celda. Tal y como se describe en [User Guide 4.3: Time and data input/output control](https://cfd.direct/openfoam/user-guide/controlDict#x18-1370004.3), estas variables se definen en el código de la siguiente manera: 

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




#### 4.5.2.2 Escritura de datos

En el fichero de <./system/controlDict> mencionado en el apartado anterior, también viene definido el control sobre cada cuanto se guarda la solución:

- **writeInterval**: este parámetro corresponde al número de ficheros de tiempo que se obtendrán por cada paso de tiempo a lo largo de la simulación. Es decir, si se quieren los resultados cada $(0,1-0,2-...-0,5)s$ con un paso del tiempo de $\delta t=0,005s$, se necesita una salida de resultados de $writeInterval=20$ (tiempos).
- **writeControl**: cuando se requiere alguna modificación de los parámetros, durante la ejecución de una simulación, si se tiene activada la opción de *writeControl* `adjustableRunTime`, el resolvedor ofrece un ajuste automático al obtener la solución. Si seS define como `timeStep` la solución se escribe cada paso del tiempo definido en *writeInterval*. Finalmente, la opción `runTime` escribe los datos por cada *writeInterval* en segundos de tiempo simulado.



####4.5.2.3 Parámetros del resolvedor

Las simulaciones descritas en este trabajo, emplean el código `interFoam`, que resolverá las ecuaciones RANS para dos fases incompresibles usando una discretización de volúmenes finitos. Además, con el método VOF (volumen of fluids) cada fase se describe con la fracción de fase para determinar el volumen ocupado por el fluido en cada celda.

Para asegurar una estabilidad numérica y exactitud temoral durante el proceso de convergencia hacia la solución, se requirie un número de Courant inferior a la unidad. La velocidad del flujo varia por el dominio, así que será necesario definir el paso del tiempo para el caso más extremo. El **número de Courant** para una celda se define como:
$$
Co=\frac{\delta t ·|U|}{\delta x}
$$
donde $\delta t$ representa el paso del tiempo, |*U*| la magnitud de la velocidad a través de la celda y $\delta x$ corresponde al tamaño de celda en la dirección de la velocidad.

OpenFOAM soporta muchos solvers previamente ya compilados y listos para ser usados. Los solvers más importantes y utilizados son:

- `laplacianFoam`: Resuelve una ecuación de Laplace simple, por ejemplo, de difusión térmica.
- `potentialFoam`: Solver de flujo potencial.
- `scalarTransportFoam`: Resuelve una ecuación de transporte para un escalar pasivo.
- `icoFoam`: Solver transitorio para flujo laminar e incompresible.
- `simpleFoam`: Solver estacionario para flujo turbulento e incompresible.
- `pimpleFoam`: Solver transitorio para flujo incompresible de paso de tiempo elevado que usa el algoritmo PIMPLE (combinación de PISO-SIMPLE).
- `pisoFoam`: Solver transitorio para flujo turbulento e incompresible.
- `sonicFoam`: Solver transitorio para flujo sónico de un gas compresible.
- `interFoam`: Para flujo incompresible de dos fases, usando el método VOF.
- `dnsFoam`: Simulación numérica directa de turbulencia isotrópica.
- `electrostaticFoam`: Solver para electrostática.


#### 4.5.2.4 Simulación en paralelo

OpenFOAM posee cuatro métodos de descomposición:

1. *Simple*: Descomposición geométrica simple en la cual el dominio es dividido en piezas según la dirección, por ejemplo, 2 piezas en la dirección x, 1 en la y, etc.
2. *Hierarchical*: Misma que la simple excepto en que el usuario especifica el orden de la división direccional, por ejemplo, primero dirección y, luego en la dirección x etc.
3. *Metis*: Descomposición que no requiere entrada geométrica por el usuario y que intenta minimizar el número de fronteras entre procesadores.
4. *Manual*: Descomposición manual, donde el usuario especifica directamente la asignación de cada celda a un procesador particular.

Para cada método, hay una serie de coeficientes especificados en el diccionario *decomposeParDict*. Si se desea realizar una simulación en paralelo la forma más simple sería la siguiente:

```
decomposePar
mpirun −np 2 simpleFoam −parallel
reconstructPar
```

donde ’-np’ indica el número de procesadores a usar.




###4.5.3 Postproceso



####4.5.3.1 Funciones de postproceso

A partir de la versión 4 de OpenFOAM, las herramientas para le postprocesamiento vienen unificadas en una única interfaz en línea de comandos (*command line interface*, CLI).  Estas herramientas, descritas en [User-Guide: 6.2.1.1 Field calculation](http://cfd.direct/openfoam/user-guide/post-processing-cli/#x31-2400006.2.3), se encuentran en <$FOAM_ETC/caseDicts/postProcessing> y se pueden listar por terminal con la orden: `postProcess -list`.

Las funciones de postprocesado incluyen el procesamiento de datos, visualización de mediciones (p.e. *probes, graph plotting*), control del caso y ent/sal (I/O) en tiempo de ejecución. Las funciones se puede ejecutar por:

- procesado en tiempo real, el procesamiento de los datos se realiza **durante** la ejecución de una simulación;
- postprocesado convencional, el procesamiento de los datos se realiza **después** de haber finalizado una simulación.

Ambas aproximasiones tienen sus ventajas, el postprocesado convencional permite seleccionar cómo analizar los datos después de obtener los resultados. Por otro lado, el postproceso en tiempo real ofrece una mayor flexibilidad, ya que se tiene acceso a todos los datos almacenados en la base de ejecución, en lugar de sólo en los tiempos escritos durante la simulación. Así mismo, cuando el usuario lo decida podrá obtener los resultados. Las funciones objeto pueden listarse con la orden *foamList* junto con la opción *functionObjects*, es decir: `foamList -functionObjects`.



#### 4.5.3.2 Obtención de resultados en tiempo real

Aparte de permitir calcular los campos de las variables especificadas, se puede calcular el caudal, fuerzas, datos numéricos (residuos), etc., de varias maneras.  Algunas de las formas más típicas de implementar las funciones son las siguientes: 

1. Incluyendo la función en el subdiccionario de funciones dentro del fichero <./system/controlDict> del caso, como por ejemplo para hallar el caudal de salida:

   ```
   functions
   {
       #includeFunc  flowRatePatch
       …  other function objects here … 
   } 
   ```

   Además, se añade el fichero de configuración ubicado en <./system/flowRatePatch>, el cual se puede obtener de <$FOAM_ETC/caseDicts/postProcessing>.

2. Otra forma es indicando en el mismo diccionario, el área del controno por el cual el flujo atraviesa y de donde se quieren extraer los datos, empleando la sintaxis *keyword=entry*:

   ```
   functions
   {
       #includeFunc  flowRatePatch(name=outlet)
       …  other function objects here … 
   } 
   ```

3. En los casos donde se requiera la solución para un campo, sólo se necesita la entrada como argumento de la función. Por ejemplo, si se quiere escribir la velocidad por cada paso durante una simulación, se puede añadir de la siguiente forma:

   ```
   functions
   {
       #includeFunc  mag(U)
       …  other function objects here … 
   } 
   ```

   Esto funciona porque el argumento U está representado por la sintaxis `field`, para ver la lista completa se puede consultar <$FOAM_ETC/caseDicts/postProcessing/fields/mag>.

Algunas funciones requieren la configuración de muchos parámetros, p.e. *forces, forceCoeffs, surfaces*, etc. Para estas funciones, es más fiable y conveniente copiar y configurar la función usando la opción 1, antes que a través de argumentos. 



#### 4.5.3.3 Obtención de resultados al final

Una vez se haya completado la simulación  se pueden ejecutar diferentes funciones con la utilidad *postProcess*. Para conocer estas funciones, introducir por línea de comandos la orden: `postProcess -help`.  De entre ellas se pueden formular las siguientes:

1. Las funciones simples, como magnitudes, se pueden ejecutar con la opción *-func*; si una orden por línea de comandos contiene carácteres, generalmente va entre comillas:

   `postProcess -func "mag(U)"`

   Esta operación calcula y escribe las magnitudes del campo de la velocidad en un fichero denominado <mag(U)> en cada directorio temporal.

2. De forma similar, se puede calcular el caudal a través de un área, que corresponda a un contorno predefinido en el modelo:

   `postProcess -func "flowRatePatch(name=outlet)"`

3. Si lo que se quiere es calcular la presión total para un flujo incompresible:  
   $$
   P_{Tot}= p + \frac{|U|^2}{2}
   $$
   con una presión cinemática, $p$, la función disponible a ejecutar es:

   `postProcess -func totalPressureIncompressible`

   - Si se devuelve el error: `FOAM Warning : functionObject pressure: Cannot find required field p`. Quiere decir que el campo de presiones no se ha cargado; lo mismo para el campo de la velocidad, *U*. Para que funcione, se pueden cargar los dos campos separados por una coma:

     `postProcess -func "totalPressureIncompressible(p,U)"`

4. Alternativamente, se puede cargar una lista de variables separadas por un espacio, usando la opción *-field*:

   ` postProcess -fields "(p U)" -func totalPressureIncompressible`

Ambas opciones funcionan de forma efectiva porque los datos de la presión y la velocidad están disponibles directamente desde los ficheros *p* y *U*.



#### 4.5.3.4  Muestreo de datos

Existen conjuntos de funciones que permiten obtener los resultados en un formato preparado para procesarlo desde otras herramientas y generar gráficas de forma sencilla, [User Guide: 6.3 Graphs monitoring](http://cfd.direct/openfoam/user-guide/graphs-monitoring/). Para ello, es necesario que el usuario proporcione una localización (por puntos o líneas) y las variables a guardar. Los dos métodos principales son:

- Por un lado, si se requiere monitorizar valores en un número pequeño de localizaciones, se utiliza *probes*,  [6.2.1.8 Probes](http://cfd.direct/openfoam/user-guide/post-processing-cli/#x31-2360006.2.1.8). Esta función identifica la celda más cercana a la ubicación de la medición definida (*probeLocations*) y los datos se escriben en un archivo (ordenados por columnas tiempo-variables) en un formato definido por el usuario (por ejemplo .csv), adecuado para trazar un gráfico. Para configurar esta función:

  - Copiar el archivo <caseDicts/postProcessing/probes/probes.cfg> a la carpeta *system* del caso.

  - Modificar el archivo <./system/controlDict>, para ejecutar la función *probes* en cada iteración: 

    ```
    functions
    {
        #includeFunc  probes
    }
    ```

- Por otro, la función *singleGraph*, escribe los datos de las variables especificadas a lo largo de una línea (definida por dos puntos, de inicio y final) en un fichero por cada paso del tiempo. Se configura como el método anterior, tomando como referencia  <FOAM_ETC/caseDicts/postProcessing/graphs/singleGraph>.


#### 4.5.3.5 Monitorización de resultados en tiempo real

Existen métodos para supervisar, durante las simulaciones, los resultados por pantalla, para ello se utiliza el *script* `foamMonitor` (`-help` para saber las opciones disponibles). Por ejemplo, para conocer los residuos, se busca el diccionario disponible en OpenFOAM:

`find $FOAM_ETC -name residuals`

Tras ubicarlo, se copia al directorio <./system> del caso y se incluye la función en `controlDict`.

Es aconsejable borrar el directorio de `postProcessing` para evitar duplicaciones de ficheros y después ejecutar el resolverdor en segundo plano: `interFoam > log &`

Se puede ejecutar la utilidad `foamMonitor` con la opción `-l` para una escala logarítmica en el eje *y*, durante la simulación, y ver la actualización automática del gráfico:

`foamMonitor -l postProcessing/residuals/0/residuals.dat`

![residuals_foamMonitoring](grafBasic/41residuals_foamMonitoring.png)

Gráfico 4.1: Ejemplo de visualización de residuos con *foamMonitoring* ,para las variables *p* y *Ux*. [Fuente: <./of-run/canal/canal2D/03-calan2DRAS-sample>]

Otra forma para visualizar los residuos, es siguiendo los pasos de la instalación del paquete [PyFoam](http://openfoamwiki.net/index.php/Contrib/PyFoam). Esta opción resulta mucho más sencilla, dado que no se requiere ninguna configuración adicional en el caso, está preconfigurado para analizar las variables principales implicadas en el caso. Basta con ejecutar el código de resolución en segundo plano y introducir la orden: `pyFoamPlotWatcher.py log.interFoam`



![42-residuals_py220](grafBasic/42-residuals_py220.png)

Gráfico 4.2: Ejemplo de visualización de residuos con *pyFoam*. [Fuente: <./of-run/canal/canal2D/03-calan2DRAS-sample>]