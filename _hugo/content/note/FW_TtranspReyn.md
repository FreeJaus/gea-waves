---
title: "Teorema del transporte de Reynolds"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

Para convertir el an�lisis de un sistema en el an�lisis de un volumen de control, se deben aplicar las leyes b�sicas en las regiones espec�ficas en lugar de a masas concretas. Esta conversi�n matem�tica se consigue mediante el llamado teorema de Reynolds, aplicable a todas las leyes b�sicas. Todas estas leyes se refieren a derivadas temporales de propiedades fluidas (m, V, H y E). Por tanto, lo que se necesita es relacionar la derivada temporal de una propiedad del sistema con la variaci�n de dicha propiedad dentro de una regi�n concreta.
La f�rmula de conversi�n difiere ligeramente seg�n se trate de vol�menes fijos, m�viles o deformables.
-El volumen de control fijo: encierra una regi�n estacionaria (la superficie de control es un concepto abstracto y no obstruye de ninguna forma el flujo), resaltando los esfuerzos que forman parte en la ecuaci�n de cantidad de movimiento.
- m�vil: cuando el inter�s se centra en un objeto en movimiento, de forma que el volumen de control se mueve con �l a la misma velocidad. El volumen de control tiene volumen fijo, pero se debe tener en cuenta el movimiento relativo entre el agua y el objeto flotante. Si V es constante, este movimiento relativo tendr� configuraci�n estacionaria, lo cual simplifica el an�lisis. Si V es variable, el movimiento relativo ser� no estacionario, de forma que habr� dependencia temporal en los resultados, y en la ecuaci�n de cantidad de movimiento aparecer�n ciertos t�rminos que reflejar�n el car�cter no inercial (acelerado) del sistema de referencia.
- deformable: en este caso se debe tener en cuenta la variaci�n del movimiento relativo en el contorno, y tambi�n entrar� en el an�alisis el cambio de forma del volumen de control.

__Aproximaciones unidimensionales al t�rmino de flujo__
En muchas aplicaciones, el flujo que atraviesa la superficie de control en ciertas entradas y salidas es aproximadamente *unidimensional*; esto es, las propiedades del flujo son casi uniformes a trav�s de las secciones transversales de entrada y salida. Para un volumen de control fijo, la integral de superficie se reduce a una suma de productos positivos (salida) y negativos (entrada) de las propiedades de cada secci�n.

En los textos de Hansen[4] y Potter et al. [5] se puede encontrar un estudio m�s profundo y detallado del an�lisis de vol�menes de control deformables.

4. G.F. Wislicenus, Fluid Mechanic of Turbomachinery, 2d ed., McGraw-Hill, New York, 1965.
5. S.L. Dixon, Fluid Mechanics and Thermodynamics of Turbomachinery, 5th ed., Elsevier, New York, 2005.