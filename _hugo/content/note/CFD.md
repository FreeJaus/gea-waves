---
title: "Aparición del CFD y estructura de los códigos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

**La dinamica de fluidos computacional** es una de las ramas de la mecánica de fluidos que usa métodos numéricos y algoritmos para estudiar y analizar problemas que involucran fluidos en movimiento, mediante la solución de las ecuaciones de Navier-Stokes, transferencia de calor, entre otras, por ordenador. Existen diferentes métodos numéricos y algoritmos que resuelven de distinta forma las ecuaciones fundamentales.

- [Una moderna herramienta para el estudio y analisis de fluidos](http://docplayer.es/720690-Simulacion-de-fluidos-utilizando-computadores-una-moderna-herramienta-para-el-estudio-y-analisis-de-fluidos.html)



A partir de 1970 Brian Spalding inspirado en Patankar y Spalding, desarrolló una formulación implícita en términos de velocidad y presión, introduciendo por primera vez el método de acoplamiento SIMPLE (Semi- Implicit Method for Pressure-Linked Equations).

La concentración de los códigos, como ANSYS (lider mundial en desarrollo de herramientas de análisis en el campo de la ingeniería asistida por ordenador (CAE) haciéndose con la compra del código numérico CFX y tres años después de FLUENT) y CD-Adapco (heredera del código STAR-CD y participada por la empresa de CAD Dassault Systems (fabricante de CATIA) han dado lugar a un progresivo incremento en los precios de las licencias. Sin embargo, esta técnica puede verse contrarrestada con la aparición de nuevos códigos numéricos de distribución libres, como Linux. El pionero en la creación de códigos libres de CFD es OpenFOAM.

Las técnicas CFD son ya, a todos los efectos, una herramienta más dentro de la ingeniería asistida por ordenador, utilizada universalmente en la industria. Sus posibilidades para simular todo tipo de fenómenos y flujos hace que los softwares CFD sean una parte indispensable en procesos de diseño aerodinámico, hidrodinámico o procesos productivos.

Códigos CFD: La mayoría de los programas utilizan el método de volumenes finitos para resolver numéricamente las ecuaciones de gobierno de la Mecánica de Fluidos.

+ El dominio se discretiza (se divide) en un número finito de volúmenes de control (celdas volumétricas en simulaciones tridimensionales y planas en casos bidimensionales).
+ Se plantea en cada celda las ecuaciones generales de conservación (o transporte) para la masa, la cantidad de movimiento, la energía, etc.
+ Las ecuaciones que sea necesario resolver se disretizan y linealizan para obtener un sistema algebraico de ecuaciones. 
+ Finalmente, se resuelve numéricamente (de forma iterativa) el sistema algebraico para obener la solución final del campo fluidodinámico.

Todos los códigos presentan la siguiente estructura: un módulo de preproceso, otro de solver y uno final de postproceso. Cada uno de ellos responde a las siguientes funciones:

- PREPROCESO: 
  - Definición de la geometría a modelizar (el dominio compuacional)
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
