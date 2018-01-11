# 2. Contexto

Con este trabajo se pretende realizar un análisis de las tecnologías existentes para el aprovechamiento del mar y, junto con ello, estudiar el principio de funcionamiento físico de un caso práctico. El estudio se realizará mediante un ensayo y simulándolo por ordenador para verificar los resultados. 

Actualmente no se dispone de normativas o guías que describan con detalle las consideraciones a tener en cuenta para definir el modelo físico de un caso y simularlo. No obstante, existen técnicas para verificar 

*/ El **teorema de $\pi​$ de Vaschy-Buckingham** es el teorema fundamental del análisis dimensional. El teorema establece que dada una relación física expresable mediante una ecuación en la que están involucradas **n** magnitudes físicas o variables, y si dichas variables se expresan en términos de **k** cantidades físicas dimensionalmente independientes, entonces la ecuación original puede escribirse equivalentemente como una ecuación con una serie de **n-k** números adimensionales construidos con las variables originales[https://es.wikipedia.org/wiki/Teorema_%CF%80_de_Vaschy-Buckingham]. Este teorema explica que si se quisiera realizar una simulación a escala, sin cambiar la temperatura ni la gravedad, las dimensiones también debieran ser iguales, luego físicamente no tendría sentido. Otra forma de entenderlo es con el número de Reynolds, parametro adimensional que depende de la geometría del modelo, si se quisiera aumentar este número, sería necesario bajar la temperatura o aumentar la presión. 
/*

Adicionalmente, y puesto que hasta el momento no se dispone de una guía que analice las consideraciones a tener en cuenta para simular un caso de principio a fin, se tratará de reunir la información más relevante en un manual, que facilite al ususario entender los pasos a seguir para simular
un flujo, de condiciones determinadas, a través de un diseño modelado por ordenador (CAD, Computer-aided design)

---
Costa Rica
Portugal produjo el 100% de su electricidad con energías renovables durante el mes de marzo [elmundo.es]04/04/18
