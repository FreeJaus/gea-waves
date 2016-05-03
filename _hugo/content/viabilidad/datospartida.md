---
title: "Datos de partida"
keywords: 
weight: 2

publishdate: 2016-01-01
date: 2016-01-01

summary: "Froga"
---

<!--more-->

A diferencia de los problemas estáticos, donde sólo se requiere conocer la densidad del fluido y la posición de la superficie libre, en la mayoría de los problemas con flujos es necesario analizar un estado arbitrario de movimiento del fluido definido por la geometría, las condiciones de contorno y las leyes de la mecánica [3]. Para afrontar esta tipología de problemas se abordarán las tres técnicas básicas del análisis de los problemas de flujos arbitrarios:

1. Volumen de control, o análisis integral a gran escala. A menudo basado en propiedades "unidimensionales" o promediadas en el contorno.

2. Diferencial, o análisis a pequeña escala.  En principio, la descripción diferencial también puede ser utilizada para cualquier problema, como el flujo en conductos rectos.  No obstante, las ecuaciones diferenciales pueden resolverse de forma numérica, y el campo de la Mecánica de Fluidos Computacional (CFD, Computational Fluid Dynamics) proporciona en la actualidad buenas estimaciones casi para cualquier caso.

3. Experimental, o análisis dimensional. Se puede aplicar a cualquier problema, ya sea analítico, numérico o experimental. Esta aproximación es particularmente útil para reducir el coste de la experimentación.

Aunque las ecuaciones de gobierno de la Mecánica de Fluidos quedaron definitivamente formuladas desde el siglo XVIII por Euler y Lagrange y posteriormente por Navier y Stokes, no era posible obtener una única solución analítica. Históricamente, se han llevado a cabo estudios experimentales o análisis dimensionales para obtener la solución al problema. No obstante, junto con la creciente mejora de los ordenadores, surgió el CFD.

En todos los casos, el flujo debe satisfacer las tres leyes de conservación de la mecánica más una relación de estado (termodinámica), habiendo introducido las condiciones iniciales y de contorno apropiadas, es decir:
1. Conservación de la masa (continuidad).
2. Conservación de la cantidad de movimiento (segunda ley de Newton).
3. Conservación de la energía del flujo (primer principio de la termodinámica).
4. Una relación de estado como ρ=ρ(p,T).
5. Condiciones de contorno apropiadas sobre superficies sólidas, entrefases, entradas y salidas.

En el análisis integral y diferencial, estas cinco leyes están expresadas en términos matemáticos y se resuelven mediante métodos numéricos. En un estudio experimental, el fluido cumple de por sí estas relaciones por tratarse de leyes fundamentales de la física.

La mayoría de los programas utilizan el método de volumenes finitos para resolver numéricamente las ecuaciones de gobierno de la Mecánica de Fluidos. El procedimiento a seguir  se puede resumir de la siguiente forma:

+ El dominio se discretiza (se divide) en un número finito de volúmenes de control (celdas volumétricas en simulaciones tridimensionales y planas en casos bidimensionales).
+ Se plantea en cada celda las ecuaciones generales de conservación (o transporte) para la masa, la cantidad de movimiento, la energía, etc.
+ Las ecuaciones que sea necesario resolver se disretizan y linealizan para obtener un sistema algebraico de ecuaciones. 
+ Finalmente, se resuelve numéricamente (de forma iterativa) el sistema algebraico para obener la solución final del campo fluidodinámico.

El caso se simulará usando el software OpenFOAM (Open Field Operation And Manipulation), se trata de un código CFD robusto y avanzado, ampliamente usado en la industria. Está orientado a objetos, con estructura modular, facilitando programar nuevos resolvedores y condiciones de entorno. Además, dispone de una amplia compatibilidad con diversas aplicaciones (para poder crear el modelo mediante un programa de CAD o para el procesamiento de datos), no siendo necesario una profundización extensa en la amplitud del código. Las librerías están escritas en lenguaje C++, por ello se requieren unos conocimientos básicos de programación.
Todos los códigos presentan la siguiente estructura: un módulo de preproceso, otro de solver y uno final de postproceso [4]. Cada uno de ellos responde a las siguientes funciones:

## PREPROCESO: 
  - Definición de la geometría a modelizar (el dominio compuacional).
  - Generación de la malla o división del dominio en un número suficiente de celdas o elementos que no se superpongan y que cubran toda la geometría.
  - Identificación de los fenómenos físicos que pretenden modelarse.
  - Definición de las propiedades de los flujos que intervendrán en el problema.
  - Especificación de las condiciones iniciales y de contorno del problema.

La generación de la malla es muy importante, porque condicionará definitivamente la calidad de los resultados. En principio, cuanto más fina sea la malla, más próxima a la solución real será la simulación. Sin embargo, mallas extraordinariamente finas aumentan considerablemente el tiempo de cálculo, por lo que siempre es necesario llegar a una elección de compromiso. Además, un mallado eficiente siempre ha de ser más fino en aquellas zonas donde se prevé un mayor gradiente en las variables del flujo.

## SOLVER: 
onstituye la parte central del programa de resolución y es el encargado de resolver de forma iterativa las ecuaciones que se han activado previamente en el preproceso, guardando los resultados calculados en el paso de tiempo definido previamente. El principal control sobre el paso del tiempo es el número de Courant, el cual representa la porción de flujo que atraviesa cada celda por el efecto de la advección, en el paso del tiempo. 

En la práctica, definido el código que se va a emplear, modificadas las variables de tiempo de cálculo e introducidas las funciones para hallar los parametros deseados (ej. fuerza de arrastre, altura de la SLL,...), el usuario sólo tendrá que lanzar la ejecución y esperar que los recursos computacionales de los que dispone resuelvan el caso.

Las ejecuciones, en función de los modelos y del tamaño de la malla, pueden durar desde minutos hasta semanas o meses de cálculos en tiempo real. 

## POSTPROCESO: 
Esta fase comprende el análisis de los resultados mediante una serie de herramientas gráficas. Es una parte fundamental por cuanto permiten gestionar la ingente cantidad de información que el código es capaz de generar. No sólo se trata de disponer una interfaz gráfica, sino de una herramienta que permita proporcionar variables integradas y promedidas para ofrecer resultados globales. 
  - Representación gráfica del dominio y la malla.
  - Mapas de contornos de las variables, planos de corte, trazas vectoriales, líneas de corriente, entre otras opciones de vista. 
  - Gráficas y distribuciones de las mediciones escalares.
