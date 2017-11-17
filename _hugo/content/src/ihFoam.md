# ihFOAM
Toda la información se aloja en Contrib/IHFOAM [1](https://openfoamwiki.net/index.php/Contrib/IHFOAM)

## Descripción general
El paquete de IHFOAM incluye:
* Condiciones de contorno individuales para la generación de olas y la absorción activa de las olas para el campo de alpha1 y U. (libIHwaveGeneration.so)
  * IH_Waves_InletAlpha
  * IH_Waves_InletVelocity
* Condiciones de contorno para la absorción pura de las olas aplicable al campo de velocidades. Fundado en teorías 2D o 3D, aplicables a casos en 3D. (libIHwaveAbsorption.so)
  * IH_3D_3DAbsorption_InletVelocity
  * IH_3D_2DAbsorption_InletVelocity
* Resolvedores para usarlos con OpenFOAM.
  * ihFoam
  * ihDyMFoam

## Resolver el caso con el código ihFOAM
1. Registrarse para obtener los tutoriales y el manual de IHFOAM:
* [2](http://ihfoam.ihcantabria.com/source-download/)--> [3](https://bitbucket.org/phicau/ihfoam_materials/src)
2. Descargar el código:
`git clone http://github.com/IHFOAM/ihFOAM.git`
* En caso de errores en la compilación, descarcar los ficheros actualizados desde [4](https://github.com/phicau/IHFOAM), solución obtenida en [5](http://www.cfd-online.com/Forums/openfoam-solving/138987-ihfoam-thread-11.html): 
`git clone https://github.com/phicau/IHFOAM`
* El código está dividido en dos carpetas principales:
  * genAbs
   - waveAbsorption 
   - waveGeneration 
   - common 
  * solvers
   - ihFoam 
3. Compilación de condiciones de contorno:
`cd ~/IHFOAM/genAbs`
`./allMake`
4. Complilación del resolvedor para la versión de OpenFOAM adecuada:
`cd ~/IHFOAM/solvers/ihFoamOF300`
`./allMake`
5. Copiar el caso de la carpeta IHFOAM:
`cp -r ~/IHFOAM/tutorials/OF300/CR35_dambreak/ ~/Documentos/MiProyecto/CASOSopenFOAM/ihFoam/`
6. Ejecutar el caso:
`./runCase`
7. Instalar matplotlib para visualizar los gráficos de la posición en *x* e *y* de la capa libre en el tiempo.
[6](http://matplotlib.org/users/installing.html)
