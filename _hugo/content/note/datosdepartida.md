---
title: "Datos de partida"
keywords: datos de partida

publishdate: 2016-01-01
date: 2016-01-01
---

A diferencia de los problemas estáticos, donde sólo se requiere conocer la densidad del fluido y la posición de la superficie libre, en la mayoría de los problemas con flujos es necesario analizar un estado arbitrario de movimiento del fluido definido por la geometría, las condiciones de contorno y las leyes de la mecánica. Se presentarán las tres técnicas básicas del análisis de los problemas de flujos arbitrarios:

1. Volumen de control, o análisis integral a gran escala. A menudo basado en propiedades "unidimensionales" o promediadas en el contorno.

2. Diferencial, o análisis a pequeña escala.  En principio, la descripción diferencial también puede ser utilizada para cualquier problema, como el flujo en conductos rectos.  No obstante, las ecuaciones diferenciales pueden resolverse de forma numérica, y el campo de la Mecánica de Fluidos Computacional (CFD, Computational Fluid Dynamics) proporciona en la actualidad buenas estimaciones casi para cualquier caso.

3. Experimental, o análisis dimensional. Se puede aplicar a cualquier problema, ya sea analítico, numérico o experimental. Esta aproximación es particularmente útil para reducir el coste de la experimentación.

El análisis diferencial comenzó con Euler y Lagrange en el siglo XVIII, y el análisis dimensional dio sus primeros pasos con lord Rayleigh a finales del siglo XIX, pero el método del volumen de control, aunque fue propuesto por Euler y utilizado más tarde por Reynolds a finales del siglo XIX, no se desarrolló sobre una base rigurosa como una herramienta analítica hasta la década de 1940.

Las ecuaciones de gobierno de la Mecánica de Fluidos quedaron definitivamente formuladas desde el siglo XVIII por Euler y posteriormente por Navier y Stokes (los cuales incluyeron los términos de transporte viscoso a la formulación de Euler). Las ecuaciones de Navier-Stokes incluyen las leyes de conservación para la masa, la cantidad de movimiento y la energía de un flujo. Estas se constituyen en un sistema acomplado de ecuaciones del que no es posible obtener una única solución analítica. Historicamente, se han llevado a cabo estudios experimentales o análisis dimensionales para obtener la solución al problema. En 1970, junto con la creciente mejora de los ordenadores, surgió el CFD.

(RANS): Para flujos incompresibles y de viscosidad cte 
(VARANS,Volume-averaged Reynolds-Averaged Navier-Stokes)

El prototipo de Columna Oscilante de Agua se simulará usando el software OpenFOAM (Open Field Operation And Manipulation), se trata de un código CFD robusto y avanzado, ampliamente usado en la industria. Las fuentes son libres y abiertas, con lo que está disponible sin costes de licencia. Está orientado a objetos, con estructura modular, facilitando programar nuevos resolvedores, condiciones de entorno y la compatibilidad con diversas aplicaciones, no siendo necesaria una profundización extensa en la amplitud del código. Las librerías están escritas en lenguaje C++, por ello se requieren unos conocimientos básicos de programación.

El procedimiento para resolver el sistema, recae en el algoritmo: SIMPLE (Semi-Implicit Method for Pressure-Linked Equations), permite garantizar la convergencia de las ecuaciones en cada paso de tiempo, PISO (Pressure Implicit with Splitting of Operators), PIMPLE (PISO + SIMPLE) versión más reciente.

El principal control sobre el paso del tiempo es el número de Courant, el cual representa la porción de flujo que atraviesa cada celda por el efecto de la advección, en el paso del tiempo.

IHFOAM: Nuevo resolvedor programado para superar las limitaciones de generación y absorción del oleaje del OpenFOAM, contando con una rigurosa implementación de sistemas de ecuaciones.
Se ha implementado un código para generar olas que representen la realidad según las teorías: Stokes I, II y V, colonoidales y funciones de transferencia para olas regulares; ola solitaria de Boussinesq; olas irregulares de 1er y 2º orden; y la reproducción del perfil de velocidad de ola tipo pistón. La gráfica de Le Méhauté representa las teorías de olas (waveTheory) mencionadas en función de la altura, profundidad, periodo de onda.

Para poder experimentar con la generación de diferentes tipos de oleaje, se diseñarán un par de modelos de pala. Permitiendo, captar más diferencias entre los valores de los parametros que definen una ola. 