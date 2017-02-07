---
title: "Métodos de acoplamiento para la resolución de ecuaciones"
keywords: SIMPLE, PISO, PIMPLE

publishdate: 2016-01-01
date: 2016-01-01
---
Especially designed solver called MULES (multidimensional universal limiter for explicit solution). It makes use of a limiter factor on the fluxes of the discretised divergence term to ensure a final value between 0 and 1. For further reference regarding the governing equations see Rusche (2002)

[rusche 2002] Rusche, H., 2002. Computational fluid dynamics of dispersed two-phase flows at high phase fractions. Ph.D. thesis, Departament of Mechanical Engineering, Imperial Collage of Science, Tecnology & Medicine, London.


El algoritmo SIMPLE (Semi-Implicit Method for Pressure Linked Equations), desarrollado por Patankar y Spalding en 1972, es un método basado en la reformulación de la presión, de utilización generalizada en el caso de flujos incompresibles.

La idea fundamental es definir una ecuación discretizada para la presión (o alternativamente, para una cantidad muy relacionada llamada *corrección de la presión*) a partir de la ecuación de continuidad discreta. Puesto que la ecuación de continuidad contiene valores de velocidad en las caras, se necesita alguna forma de relacionar estas velocidades con los valores de presión en los centroides de las celdas. El algoritmo SIMPLE utiliza las ecuaciones de momento discretas para hacer dicha relación.

Se Parte por un campo de presiones supuesto, se resuelven las ecs de momento en x e y obteniendo un campo de velocidades.
Se define el valor de corrección que separa los campos de la solución real de la supuesta mediante una variable primada y conbinando estas ecs exactas con las ecs anteriores.
Importante simplificación, eliminando las celdas vecinas para la corrección de las velocidades.
Definida la p para las celdas centradas en vectores, se plantea la ec. de continuidad sobre una celda escalar P pto central del volumen de control.
tb se puede definir los flujos másicos en las caras.
A partir de ahí se plantea la ec de corrección para la presión para acoplar los campos de presión y velocidad de forma que satisfagan la ec de continuidad y la ec de momento a la vez.

Al eliminar el término de correción de la velocidad, de forma implícita se está haciendo recaer sobre el término de la presión todo el peso de la corrección. Así, aunque la velocidad corregida cumplirá la continuidad, el campo de presiones quedará sobrecorregido. Este hecho implica que el algoritmo SIMPLE tiene tendencia a divergir si no se emplea alguna técnica de subrelajación.

<Técnicas Numéricas en Ingeniería de Fluidos>

PISO-> para problemas transitorios
SIMPLE-> para los continuos
PIMPLE-> PISO+SIMPLE. corrector de la ec de momento

fvSolution Dict: controla las ecs resolvedoras, tolerancias y algoritmos

# InfoAddPISO

Due to the nature of the PISO-algorithm used in interFoam, it is necessary to have a very "good" pressure field, as the pressure field is required in the velocity correction step of the scheme in order to reach mass conservation (i.e.div(U)=0).

If you look at the PISO-algorithm you will see that this means if the flux is zero (as it is orthogonal to the wall) it is necessary that the second derivative of pressure (orthogonal to the wall) must be zero, too (in areas where the density is constant).

buoyantPressure fulfills this requirement in areas of constant VOF-function / density. I'm not sure about mass conservation if sloped walls touch areas with VOF-values 0<VOF<1.

http://www.cfd-online.com/Forums/openfoam/67155-interfoam-mass-conservation.html

http://cfd.direct/openfoam/user-guide/fvSolution/#x21-1170004.5
