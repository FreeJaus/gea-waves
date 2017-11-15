---
title: "Técnicas básicas de análisis de los flujos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---


Hay tres vías posibles para abordar un problema fluidodinámico. (Las tres igual de importantes)
1. Volumen de control, o análisis integral (Capítulo 3).
2. Partícula fluida, o análisis diferencial (Capítulo 4).
3. Estudio experimental, o análisis dimensional (Capítulo 5).

En todos los casos, el flujo debe satisfacer las tres leyes de conservación de la mecánica más una relación de estado (termodinámica) y las condiciones iniciales y de contorno apropiadas:
1. Conservación de la masa (continuidad).
2. Conservación de la cantidad de movimiento (segunda ley de Newton).
3. Conservación de la energía (primer principio de la termodinámica).
4. Una relación de estado como rho=rho(p,T).
5. Condiciones de contorno apropiadas sobre superficies sólidas, entrefases, entradas y salidas.

En el análisis integral y diferencial, estas cinco leyes están expresadas en términos matemáticos y se resuelven mediante métodos numéricos. En un estudio experimental, el fluido cumple de por sí estas relaciones por tratarse de leyes fundamentales de la física.




Resumido: 
El movimiento de un fluido puede analizarse desde dos puntos de vista:
1) realizando una descripción detallada del flujo en cada punto (x,y,z) del campo fluido, o
2) trabajando con una región finita del espacio, realizando un balance entre el fluido que entra y que sale de ella, determinando los efectos netos (como la fuerza, momento o el cambio de energía total.
La segunda técnica se conoce como el análisis integral o de "volumen de control". Una vez analizado el concepto, al igual que en termodinámica, se determina la variación por unidad de tiempo de las propiedades del fluido, obteniendo como resultado el denominado _teorema del transporte de Reynolds_. A continuación, se aplica este teorema a la masa, la cantidad de movimiento, el momento cinético y la energía, obteniendo así las cuatro relaciones básicas de la Mecánica de Fluidos para un volumen de control.

# Leyes básicas de la Mecánica de Fluidos

Los problemas estáticos sólo requieren, básicamente, conocer la densidad del fluido y la posición de la superficie libre; sin embargo, en la mayoría de los problemas con flujos es necesario analizar un estado arbitrario de movimiento del fluido definido por la geometría, las condiciones de contorno y las leyes de la mecánica. Se presentarán las tres técnicas básicas del análisis de los problemas de flujos arbitrarios:
1. Volumen de control, o análisis integral a gran escala.
2. Diferencial, o análisis a pequeña escala.
3. Experimental, o análisis dimensional.

El análisis con volúmenes de control es válido para cualquier flujo, aunq a menudo se basa en propiedades "unidimensionales" o promedidas en el contorno. En principio, la descripción diferencial también puede ser utilizada para cualquier problema, como el flujo en conductos rectos. No obstante, las ecuaciones diferenciales pueden resolverse de forma numérica, y el campo de la Mecánica de Fluidos Computacional (CFD, _Computational Fluid Dynamics_) proporciona en la actualidad buenas estimaciones casi para cualquier geometría. Para terminar, el análisis dimensional {explicado en tal capi} se puede aplicar a cualquier problema, ya sea análitico, numérico o exprerimental. Esta aproximación es particularmente útil para reducir el coste de la experimentación. El análisis diferencial comenzó con Euler y Lagrange en el siglo XVIII, y el análisis dimensional dio sus primeros pasos con lord Rayleigh a finales del siglo XIX, pero el método del volumen de control, aunque fue propuesto por Euler y utilizado más tarde por Reynolds a finales del siglo XIX, no se desarrolló sobre una base rigurosa como una herramienta analítica hasta la década de 1940.      

__Sistemas frente a volúmenes de control__

Todas las leyes de la mecánica están escritas para sistemas, que se definen como cantidades arbitrarias de masa de identidad fija. Todo lo externo al sistema constituye el entorno, del que el sistema está separado por su frontera o contorno. Las leyes de la mecánica establecen lo que ocurre cuando hay una iteracción entre el sistema y su entorno.
1. El sistema se define como una cantidad fija de masa
Lo que es tan obvio en los problemas de la mecánica de sólidos, en la Mecánica de Fluidos se debe prestar atención a la **conservación de la masa**.
2. Si el entorno ejerce una ferza resultante **F** sobre el sistema, la segunda ley de Newton expresa que la masa se acelera.
En Mecánica de Fluidos, la segunda ley de Newton se denomina ley de **conservación de la cantidad de movimiento**, o alternativamente, ecuación de la cantidad de movimiento. (Ley vectorial que implica tres ecuaciones escalares 
3. Si el entorno ejerce un momento resultante **M** respecto al centro de masas del sistema, habrá un efecto de rotación
M=dH/dt
donde H es el momento cinético, o **momento de la cantidad de movimiento**, del sistema con respecto a su centro de masas.
4. Si se comunica un calor al sistema o se realiza un trabajo sobre su entorno, la energía debe cambiar en una cantidad dE de acuerdo con la ecuación de **conservación de la energía**, o primera ley de la termodinámica:
 
Al analizar un volumen de control, se acomodan las leyes de un sistema para aplicarlas a una región específica que el sistema pueda ocupar en un instante determinado con independencia de que el sistema permanezca o no en esa región. Luego será necesario evaluar el flujo volumétrico o caudal *Q* o el flujo másico que atraviesa una superficie definida en el flujo.
Por convención, se considera positivo el vector unitario **n** normal hacia fuera. De esta forma, **V·n** representa un flujo de salida si es positivo y un flujo de entrada si es negativo.

# Relaciones diferenciales para una partícula fluida
Para el análisis del movimiento de los fluidos:
(1) buscar una estimación de los efectos globales (m,F,Ė) sobre una región finita o V.C.
(2) analizar punto a punto los detalles del campo fluido analizando una región infinitesimal del flujo (análisis diferencial)
Aplicar las 4 leyes de conservación básicas a un sistema infinitesimal, para obtener ecuaciones diferenciales, las cuales:
- revelan los parámetros adimensionales básicos que gobiernan el movimiento;
- ofrecen soluciones útiles si se pueden aplicar las hipótesis simplificadoras (flujo estacionario, flujo incompresible o flujo no viscoso Bernoulli).
