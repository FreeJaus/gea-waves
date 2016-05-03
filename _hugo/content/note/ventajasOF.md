---
title: "Ventajas de OpenFOAM"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

OpenFOAM (Open Field Operation And Manipulation), c�digo CFD robusto y avanzado, ampliamente usado en la industria. 

- Las fuentes son libres y abiertas, con lo que est� disponible sin costes de licencia y se puede modificar y adaptar el c�digo. 

- Est� orientado a objetos, con estructura modular que facilita programar nuevos resolvedores, condiciones de entorno y la compatibilidad con diversas aplicaciones, no siendo necesaria una profundizaci�n extensa en la amplitud del c�digo.

- Las librer�as est�n escritas en lenguaje C++, por ello se requieren unos conocimientos b�sicos de programaci�n. 

- Preparado para correr los casos en paralelo, mediante m�todos de c�lculo f�ciles de establecer y de calcular, manejando por s� la descomposici�n del proceso y la reconstrucci�n final.

- Est� dise�ado para resolver problemas complejos, soportando fluidos en dos fases con variedad de modelos de turbulencia (Ej. Modelo RAS (Reynolds-Averaged Stress), LES (Large-Eddy Simulation), k-w SST(Shear Stress Transport)).

- Al igual que la mayor�a de los programas para el an�lisis computacional de la Mec�nica de Fluidos, usa una discretizaci�n de vol�menes finitos. Este m�todo describe cada fase con la fracci�n **alfa** (alfa=1 todo agua, alfa  =0 aire) por el volumen ocupado del fluido en cada celda.

- Para el preproceso y postproceso se pueden utilizar aplicaciones para las cuales existen �rdenes directas de conversi�n listadas en la Gu�a de Usuario. No obstante, se incluye la herramienta de generaci�n de mallas est�ticas (`blockMesh` y  `snappyHexMesh`). 

- Adem�s, se a�ade el paquete de Thitd Party, el cual implementa el programa **ParaView**, software principal usado para el postproceso. 
   
