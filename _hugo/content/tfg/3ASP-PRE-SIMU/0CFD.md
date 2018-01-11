---
title: "Aparición del CFD y estructura de los códigos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---



# DEFINICIÓN DEL PROBLEMA

La simulación CFD permite obtener más precisión en los resultados, ofreciendo buenas estimaciones de lo que sucederá en la realidad. Para ello, es muy importante definir adecuadamente los parámetros del caso, así como la *escala de flujo* requerida. Esta escala, está condicionada por la longitud del dominio, la velocidad y el tiempo de simulación. Es decir, se debe retener en el modelo sólo las partes relevantes; si se define bien el dominio la solución convergerá adecuadamente. 

El parámetro adimensional que relaciona estas variables, es el número de Reynolds, si se quisiera aumentar este número, sería necesario bajar la temperatura o aumentar la presión del dominio. A medida que se aumente el número de Re o la escala de flujo, se requerirán más recursos computacionales.

El **teorema de $\pi$ de [Vaschy-Buckingham](https://es.wikipedia.org/wiki/Teorema_%CF%80_de_Vaschy-Buckingham)** es el teorema fundamental del análisis dimensional. El teorema establece que dada una relación física expresable mediante una ecuación en la que están involucradas **n** magnitudes físicas o variables, y si dichas variables se expresan en términos de **k** cantidades físicas dimensionalmente independientes, entonces la ecuación original puede escribirse equivalentemente como una ecuación con una serie de **n-k** números adimensionales construidos con las variables originales. Este teorema explica que si se quisiera realizar una simulación a escala, sin cambiar la temperatura ni la gravedad, las dimensiones también deberían ser iguales, luego físicamente no tendría sentido.



Como ya se ha visto un problema CFD implica los siguientes pasos:

+ El dominio se discretiza (se divide) en un número finito de volúmenes de control (celdas).
+ Se plantea en cada celda las ecuaciones generales de conservación (o transporte) para la masa, la cantidad de movimiento y la energía.
+ Las ecuaciones que sea necesario resolver se disretizan y linealizan para obtener un sistema algebraico de ecuaciones. 
+ Finalmente, se resuelve numéricamente (de forma iterativa) el sistema algebraico para obener la solución final del campo fluidodinámico.


Pasos para resolver un caso:

1. Geometría: diseñar el modelo con las partes relevantes para el estudio

   Se pueden usar una gran variedad de herramientas (OpenSCAD, Blender)

   OpenFoam (blockMesh, snappyHexMesh)

2. Definición del problema

   Incompresible

   Transitorio

   Turbulento

   Flojos Newtonianos

   Multifásico

   Isotérmico

   Condiciones de contorno

   La solución debe ser independiente del tamaño del dominio y de la malla

3. Generación de la malla: si se usan modelos de turbulencia $y^+$ (variable que corresponde a la longitud de la primera celda desde la pared sólida), la definición dependerá del tipo de solución que se busque

4. Discretización de ecuaciones: se trata de convertir las ecuaciones generales a algebráicas de operadores continuos a operadores discretos.

5. Análisis del esquema numérico: consistencia, estabilidad y convergencia.

6. Resolución de ecuaciones: exiten diferentes técnicas aplicables, 



Todos los códigos presentan la siguiente estructura: un módulo de preproceso, otro de solver y uno final de postproceso. Cada uno de ellos responde a las siguientes funciones:

- PREPROCESO: 
  - Definición de la geometría a modelizar (el dominio compuacional).
  - Generación de la malla o división del dominio en un número suficiente de celdas o elementos que no se superpongan y que cubran toda la geometría.
  - Identificación de los fenómenos físicos y químicos que pretenden modelarse.
  - Definición de las propiedades del fluido (o fluidos).
  - Especificación de las condiciones iniciales y de contorno del problema.

La generación de la malla es muy importante, porque condicionará definitivamente la calidad de los resultados. En principio, cuanto más fina sea la malla, más próxima a la solución real será la simulación. Sin embargo, mallas extraordinariamente finas aumentan considerablemente el tiempo de cálculo, por lo que siempre es necesario llegar a una elección de compromiso. Además, un mallado eficiente siempre ha de ser más fino en aquellas zonas donde se prevé un mayor gradiente en las variables del flujo.

- SOLVER: Constituye la parte central del programa de resolución y es el encargado de resolver de forma iterativa las ecuaciones que se han activado previamente en el preproceso (los modelos). Aun siendo la parte más importante, definido el código que se va a emplear y configuradas las funciones adicionales para obtener los parametros deseados durante la simulación (Ej. fuerza de arrastre, capa límite,...), el usuario sólo tendrá que lanzar la ejecución y esperar que los recursos computacionales de los que dispone resuelvan el caso. Las ejecuciones, en función de los modelos y del tamaño de la malla, pueden durar desde minutos hasta semanas o meses de cálculos en tiempo real.
- POSTPROCESO: Incluyendo una serie de herramientas gráficas que permiten analizar los resultados. Es una parte fundamental por cuanto permiten gestionar la ingente cantidad de información que el código es capaz de generar. No sólo se trata de disponer una interfaz gráfica, sino de una herramienta que permita proporcionar variables integradas y promedidas para ofrecer resultados globales. Incluye:
  - Representación gráfica del dominio y la malla.
  - Mapas de contornos de las variables, planos de corte, trazas vectoriales, líneas de corriente, entre otras opciones de vista. 
  - Gráficas y distribuciones de las mediciones escalares.