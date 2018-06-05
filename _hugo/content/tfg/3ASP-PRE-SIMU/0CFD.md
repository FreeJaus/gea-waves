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

