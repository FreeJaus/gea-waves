---
title: "Ventajas de OpenFOAM"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

OpenFOAM (Open Field Operation And Manipulation), código CFD robusto y avanzado, ampliamente usado en la industria. 

- Las fuentes son libres y abiertas, con lo que está disponible sin costes de licencia y se puede modificar y adaptar el código. 

- Está orientado a objetos, con estructura modular que facilita programar nuevos resolvedores, condiciones de entorno y la compatibilidad con diversas aplicaciones, no siendo necesaria una profundización extensa en la amplitud del código.

- Las librerías están escritas en lenguaje C++, por ello se requieren unos conocimientos básicos de programación. 

- Preparado para correr los casos en paralelo, mediante métodos de cálculo fáciles de establecer y de calcular, manejando por sí la descomposición del proceso y la reconstrucción final.

- Está diseñado para resolver problemas complejos, soportando fluidos en dos fases con variedad de modelos de turbulencia (Ej. Modelo RAS (Reynolds-Averaged Stress), LES (Large-Eddy Simulation), k-w SST(Shear Stress Transport)).

- Al igual que la mayoría de los programas para el análisis computacional de la Mecánica de Fluidos, usa una discretización de volúmenes finitos. Este método describe cada fase con la fracción **alfa** (alfa=1 todo agua, alfa  =0 aire) por el volumen ocupado del fluido en cada celda.

- Para el preproceso y postproceso se pueden utilizar aplicaciones para las cuales existen órdenes directas de conversión listadas en la Guía de Usuario. No obstante, se incluye la herramienta de generación de mallas estáticas (`blockMesh` y  `snappyHexMesh`). 

- Además, se añade el paquete de Thitd Party, el cual implementa el programa **ParaView**, software principal usado para el postproceso. 
   
