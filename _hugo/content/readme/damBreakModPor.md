---
title: "damBreakModPor"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

***** Caso damBreakModPor, tomando como referencia el caso CR35_damBreak de IHFOAM.


>>> Resumen de los pasos a realizar

Definir la zona de porosidad y las propiedades del material que la caractericen. 
Modificación de las fórmulas a aplicar. 
Tiempo de precisión (número de Courant). 
Cambiar el resolvedor, al de ihFoam que hallará la solución del problema teniendo en cuenta la porosidad.


>>> Geometría del caso

Ya que el modelo ha sido verificado anteriormente, no se realizarán cambios en el mismo. Pero como la geometría del caso que servirá de guía es diferente, se procede al análisis del efecto de la porosidad en una disposición diferente a la del caso CR35_damBreak, siendo adecuada en el estrecho antes de la chimenea. Además deberá tenerse en cuenta que la disposición del sistema de coordenadas en ambos casos no es la misma, en el caso a comparar de ihFoam el eje de abcisas es 'z' en vez de 'y', es decir, los puntos corresponderan con (x z y) en lugar de (x y z). Al igual que el agua, la porosidad se define en el fichero <damBreakPor/system/setFiendsDict>:

boxToCell // Porous zone
    {
        box (2.2 -1 -1) (3.2 0.333 1);
        fieldValues
        (
            volScalarFieldValue porosityIndex 1
        );
    }
 
>>> Cambios adicionales en los ficheros del caso:

+ system

-- setFieldsDict -> Además de lo explicado anteriormente, cabe mencionar que en el caso de ihFoam se define un fondo de agua sobre toda la superficie que actúa como si de un fondo infinito se tratase, amortiguando la caida del agua y consiguiendo una ola más ajustada a la realidad. Dado que en el caso de estudio se tiene un saliente contra el que el agua golpeará se comentará esta parte de código y se analizará su efecto en el siguiente caso, sin el saliente. 

-- controlDict -> El control del paso del tiempo en los casos de capa libre conlleva un importante inconveniente ya que su algoritmo es considerablemente más sensible al número de Courant que en los cálculos de un flujo de un fluido estándar. Por ello, su valor no deberá exceder de 0,5. Donde no existiera porosidad o donde la propagación de velocidad fuera más predecible, se podría especificar un paso del tiempo más ajustado que satisfaciera el criterio de Co, pero en casos más complejos resultaría bastante difícil. A raíz de este problema, el resolvedor interFoam, ofrece un ajuste automático del paso del tiempo como estándar. La parte de código a revisar, entonces, es la siguiente:

application     ihFoam;

startFrom       latestTime;

startTime       0;

stopAt          endTime;

endTime         5;

deltaT          0.001;

writeControl    adjustableRunTime;

runTimeModifiable yes;

adjustTimeStep  yes;

maxCo           0.5;
maxAlphaCo      0.5;

maxDeltaT       1;

-- fvSchemes -> Las ecuadiones a aplicar, definidas en el apartado divSchemes, se ven incrementadas en cantidad en el caso CR35_damBreak, ya que se tiene en cuenta la porosidad. Como el resto del contenido no varía, sólo se añadirá dicho apartado al caso de estudio como sigue:

divSchemes
{
    div(rhoPhi,U)  Gauss limitedLinearV 1;
    div(U)  Gauss linear;
    div((rhoPhi|interpolate(porosity)),U)  Gauss limitedLinearV 1;
    div(rhoPhiPor,UPor)  Gauss limitedLinearV 1;
    div(rhoPhi,UPor)  Gauss limitedLinearV 1;
    div(rhoPhiPor,U)   Gauss limitedLinearV 1; 
    div(phi,alpha)  Gauss vanLeer;
    div(phirb,alpha) Gauss interfaceCompression;
    div((muEff*dev(T(grad(U))))) Gauss linear;
    div(phi,k)      Gauss upwind;
    div(phi,epsilon) Gauss upwind;
    div((phi|interpolate(porosity)),k)      Gauss upwind;
    div((phi|interpolate(porosity)),epsilon) Gauss upwind;
    div(phi,omega) Gauss upwind;
    div((phi|interpolate(porosity)),omega) Gauss upwind;
}  

-- fvSolution -> [[[[Para resolver las ecuaciones de RANS (Reynold-Averaged Navier-Stokes) OpenFOAM ]]]falta explicar la funcion de freeSurface que aparece en controlDict]

La premisa del medio poroso es que la cantidad de fluido que puede entrar en una celda no es igual al volumen de la celda. Por ello el resolvedor MULES (Multidimensional Universal Limiter for Explicit Solution) necesita ser ajustado para tener en cuenta la corrección por la porosidad. Unido al resolvedor de ihFoam, IHMULES, incorpora un "input" adicional que modificará el volumen de las celdas, limitando la cantidad de agua que podrá entrar en función de la porosidad, y también, mientras el valor total de la función VOF correspondiente a la celda no exceda del factor límite de 1. 
Por lo anterior, los cambios a realizar en este fichero son:

"alpha.water.*"
    {
        nAlphaCorr      1;
        nAlphaSubCycles 3;
	alphaOuterCorrectors yes;        
	cAlpha          1;

        MULESCorr       no;

-- descomposeParDict -> Se añade sin variaciones ya que no existe conflicto entre diferentes versiones por no haber empleado la orden de descomponer el problema anteriormente.

+ constant

-- porosityDict -> En este fichero se definen las propiedades del material poroso que se empleará.

-- dynamicMeshDict
-- transportProperties
-- turbulenceProperties
-- g

+ 0
-- porosityIndex


 

