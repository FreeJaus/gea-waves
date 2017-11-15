---
title: "Teorema del transporte de Reynolds"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

Para convertir el análisis de un sistema en el análisis de un volumen de control, se deben aplicar las leyes básicas en las regiones específicas en lugar de a masas concretas. Esta conversión matemática se consigue mediante el llamado teorema de Reynolds, aplicable a todas las leyes básicas. Todas estas leyes se refieren a derivadas temporales de propiedades fluidas (m, V, H y E). Por tanto, lo que se necesita es relacionar la derivada temporal de una propiedad del sistema con la variación de dicha propiedad dentro de una región concreta.
La fórmula de conversión difiere ligeramente según se trate de volúmenes fijos, móviles o deformables.
-El volumen de control fijo: encierra una región estacionaria (la superficie de control es un concepto abstracto y no obstruye de ninguna forma el flujo), resaltando los esfuerzos que forman parte en la ecuación de cantidad de movimiento.
- móvil: cuando el interés se centra en un objeto en movimiento, de forma que el volumen de control se mueve con él a la misma velocidad. El volumen de control tiene volumen fijo, pero se debe tener en cuenta el movimiento relativo entre el agua y el objeto flotante. Si V es constante, este movimiento relativo tendrá configuración estacionaria, lo cual simplifica el análisis. Si V es variable, el movimiento relativo será no estacionario, de forma que habrá dependencia temporal en los resultados, y en la ecuación de cantidad de movimiento aparecerán ciertos términos que reflejarán el carácter no inercial (acelerado) del sistema de referencia.
- deformable: en este caso se debe tener en cuenta la variación del movimiento relativo en el contorno, y también entrará en el ançalisis el cambio de forma del volumen de control.

__Aproximaciones unidimensionales al término de flujo__
En muchas aplicaciones, el flujo que atraviesa la superficie de control en ciertas entradas y salidas es aproximadamente *unidimensional*; esto es, las propiedades del flujo son casi uniformes a través de las secciones transversales de entrada y salida. Para un volumen de control fijo, la integral de superficie se reduce a una suma de productos positivos (salida) y negativos (entrada) de las propiedades de cada sección.

En los textos de Hansen[4] y Potter et al. [5] se puede encontrar un estudio más profundo y detallado del análisis de volúmenes de control deformables.

4. G.F. Wislicenus, Fluid Mechanic of Turbomachinery, 2d ed., McGraw-Hill, New York, 1965.
5. S.L. Dixon, Fluid Mechanics and Thermodynamics of Turbomachinery, 5th ed., Elsevier, New York, 2005.