---
title: "Alcance del trabajo"
keywords: 
weight: 3

publishdate: 2016-01-01
date: 2016-01-01

description: Procedimientos para alcanzar/cumplir los objetivos.
---

Sumario del contenido: resumen, primeras líneas...

<!--more-->

Con este trabajo se pretende realizar un análisis de las tecnologías existentes para el aprovechamiento del mar y, junto con ello, estudiar un caso práctico mediante un ensayo y simulándolo por ordenador para verificar los resultados. Adicionalmente, y puesto que hasta el momento no se dispone de una guía que analice las consideraciones a tener en cuenta para simular un caso de principio a fin, se tratará de reunir la información más relevante en un manual, que facilite al ususario entender los pasos a seguir para simular un flujo, de condiciones determinadas, a través de un diseño modelado por ordenador (CAD, Computer-aided design). 

Las técnicas CFD son ya, a todos los efectos, una herramienta más dentro de la ingeniería asistida por ordenador (CAE, Computer-aided engineering), utilizada universalmente en la industria. Sus posibilidades para simular todo tipo de fenómenos y flujos hace que los softwares CFD sean una parte indispensable en procesos de diseño aerodinámico, hidrodinámico o procesos productivos.

No obstante, las tecnologías para el aprovechamiento del mar, aún se encuentran en etapa de desarrollo, por lo que no cuenta con la totalidad de la información para su instalación, operación y mantenimiento, por ello será necesaria la aplicación de suposiciones. Aun así, las investigaciones desarrolladas en este campo, con la aparición de numerosos prototipos, hacen de esta tecnología una de las más prometedora en cuanto a su rendimiento y funcionalidad. En comparación con otras energías renovables, el momento y la intensidad de las mareas y corrientes se puede predecir con siglos de anticipación [5]. Además, su densidad es muy superior a la del aire, con lo que, de la energía de las olas se obtienen altos potenciales. 

## Actividades y procedimientos:
- Estudio del estado del arte:
  - Perspectiva histórica y estado actual de la energía del mar [6], caracterizando esta fuente de energía y los avances logrados hasta el momento.
  - Clasificación y descripción del funcionamiento de los dispositivos deseñados para la obtención de energía [7].
  - Evaluación del estado actual del desarrollo de las tecnologías más prometedoras.
  - Principales iniciativas europeas de parques de olas y zonas de prueba de prototipos a escala.
  - Nivel energético disponible en la costa española.
  - Caracterización de las olas [8], generación, tipos de ondas [9] y ecuaciones que gobiernan la teoría de las olas.

- Modelo físico:
  - Definición de las condiciones iniciales del caso, identificando los fenómenos físicos que pretenden modelarse.
  - Análisis teórico de las ecuaciones que intervendran en la resolución del problema.
  - Métodos utilizados para resolver sistemas complejos.
- Simulación por ordenador:
  - Análisis de las herramientas disponibles, seleccionando el más conveniente para el trabajo que se desea realizar. 
  - Comprender cómo funciona OpenFOAM, realizando diferentes casos descritos.
  - Definición del modelo geométrico que se va a experimentar y discretización del dominio.
  - Adecuar las propiedades de los flujos, tiempo de simulación, parámetros de salida, ... del ejemplo que más se aproxime a las condiciones del caso que se quiere analizar.
  - Obtener una buena estabilidad numérica, garantizando la convergencia en el proceso iterativo. Consiguiendo, además, la independencia de la malla, es decir, el error numérico disminuye con el aumento del número de nodos, cuando las soluciones numéricas que se obtienen en diferentes mallados, coinciden con una tolerancia se dice que son independientes de la malla.
  - Vereficar los resultados con los obtenidos en el ensayo.
- Preparación del ensayo:
  - Diseño de la compuerta, del sistema de apertura y de la fijación del Pistón.
  - Sensores necesarios para la adquisición de datos. 
  - Monitorizar y registrar las mediciones de los sensores para comparar los resultados con los de la simulación.

## Obj que no formarán parte del estudio:
- Análisis computacional de la obtención de energía a partir de los diferentes tipos de dispositivos.
- Mejorar la captación del oleaje en función de su ubicación o del diseño  estructural.
- Reducir al mínimo el tiempo de resolución de la simulación computacional, por no precisar de una profundización extensa en el diseño del mallado.
- Simulación del caso a escala real.
- Análisis de la potencia real obtenida por la turbina.

## Resultados:
- Una vez obtenido el modelo matemático, introducidas las funciones a calcular, se compararán los resultados hallados computacionalmente con los resultados experimentales.
- La complejidad recaerá en en empleo de softwares que permitan la gestión de una gran extensión de datos, para visualizarlos y compararlos gráficamente.
- Manual técnico que explique en detalle los pasos a seguir que resuelva las dificultades interpuestas por los programas. 
