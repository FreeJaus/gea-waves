Simulación (fases)

Experimentación (instrumentación)

# 2.1 Descripción de fases

### 2.1.1 Fases de una simulación

Todos los problemas de CFD presentan la siguiente estructura: un módulo de preproceso, otro de procesado  y uno final de postproceso. Cada uno de ellos responde a las siguientes funciones:

- PREPROCESO: 
  - Definición de la geometría a modelizar (el dominio compuacional).
  - Generación de la malla o división del dominio en un número suficiente de celdas o elementos que no se superpongan y que cubran toda la geometría.
  - Identificación de los fenómenos físicos y químicos que pretenden modelarse.
  - Definición de las propiedades del fluido (o fluidos).
  - Especificación de las condiciones iniciales y de contorno del problema.

La generación de la malla es muy importante, porque condicionará definitivamente la calidad de los resultados. En principio, cuanto más fina sea la malla, más próxima a la solución real será la simulación. Sin embargo, mallas extraordinariamente finas aumentan considerablemente el tiempo de cálculo, por lo que siempre es necesario llegar a una elección de compromiso. Además, un mallado eficiente siempre ha de ser más fino en aquellas zonas donde se prevé un mayor gradiente en las variables del flujo.

- PROCESADO (*SOLVER*): 

  Constituye la parte central del programa de resolución y es el encargado de resolver de forma iterativa las ecuaciones que se han activado previamente en el preproceso (los modelos). Aun siendo la parte más importante, definido el código que se va a emplear y configuradas las funciones adicionales para obtener los parametros deseados durante la simulación (Ej. fuerza de arrastre, capa límite,...), el usuario sólo tendrá que lanzar la ejecución y esperar que los recursos computacionales de los que dispone resuelvan el caso. Las ejecuciones, en función de los modelos y del tamaño de la malla, pueden durar desde minutos hasta semanas o meses de cálculos en tiempo real.

- POSTPROCESO: 

  Es una parte fundamental por cuanto permiten gestionar la ingente cantidad de información que el código es capaz de generar. No sólo se trata de disponer una interfaz gráfica, sino de una herramienta que permita proporcionar variables integradas y promedidas para ofrecer resultados globales. Esta fase Incluye una serie de herramientas gráficas que permiten analizar los resultados:

  - Representación gráfica del dominio y la malla.
  - Mapas de contornos de las variables, planos de corte, trazas vectoriales, líneas de corriente, entre otras opciones de vista. 
  - Gráficas y distribuciones de las mediciones de las variables.

### 2.1.2 Experimentación

Diseño de las piezas a implementar