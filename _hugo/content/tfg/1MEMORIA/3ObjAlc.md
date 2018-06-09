# 3. OBJETIVOS DEL TRABAJO

## 3.1 Introducción 

Con este trabajo se pretende realizar un análisis de las tecnologías existentes para el aprovechamiento del mar y, junto con ello, estudiar un caso práctico mediante un ensayo y unas simulaciones por ordenador para comparar los resultados. Adicionalmente, se tratará de reunir la información más relevante que analice las consideraciones a tener en cuenta para simular un caso de principio a fin, facilitando al ususario entender los pasos a seguir para simular un fluido o varios, en unas condiciones determinadas, partiendo de un diseño modelado por ordenador (CAD, Computer-aided design).

Las técnicas CFD son ya, a todos los efectos, una herramienta más dentro de la ingeniería asistida por ordenador (CAE, Computer-aided engineering), utilizada universalmente en la industria. Sus posibilidades para simular todo tipo de fenómenos y flujos hace que los softwares CFD sean una parte indispensable en procesos de diseño aerodinámico, hidrodinámico o procesos productivos.

No obstante, las tecnologías para el aprovechamiento del mar, aún se encuentran en etapa de desarrollo, por lo que no cuenta con la totalidad de la información para su instalación, operación y mantenimiento, por ello será necesaria la aplicación de suposiciones. Aun así, las investigaciones desarrolladas en este campo, con la aparición de numerosos prototipos, hacen de esta tecnología una de las más prometedora en cuanto a su rendimiento y funcionalidad. En comparación con otras energías renovables, el momento y la intensidad de las mareas y corrientes se puede predecir con siglos de anticipación, [Romero García, RE](Romero García,RE; "Producción de energía eléctrica a partir de los mares"; Técnica Industrial; 288; Agosto 2010; pp 44-51). Además, su densidad es muy superior a la del aire, con lo que, de la energía de las olas se obtienen altos potenciales. 

## 3.2 Actividades y procedimientos

- Estudio del estado del arte:
  - Perspectiva histórica y estado actual de la energía del mar [6](Montero Sousa, JA y Calvo Rolle, JL; "Energía mareomotriz: perspectiva histórica y estado actual"; Técnica Industrial; 301; marzo2013; pp54-60), caracterizando esta fuente de energía y los avances logrados hasta el momento.
  - Clasificación y descripción del funcionamiento de los dispositivos deseñados para la obtención de energía [7]("Energía del oleaje"; Eduambiental; pp 515-550. http://comunidad.eduambiental.org/file.php/1/curso/contenidos/docpdf/capitulo22.pdf).
  - Evaluación del estado actual del desarrollo de las tecnologías más prometedoras.
  - Principales iniciativas europeas de parques de olas y zonas de prueba de prototipos a escala.
  - Nivel energético disponible en la costa española.
  - Caracterización de las olas [8](Pelissero, M et al.; "Aprovechamiento de la Energía Undimotriz"; Proyecciones, Vol 9 No. 2, octubre 2011; pp 53-65), generación, tipos de ondas y ecuaciones que gobiernan la teoría de las olas.

- Modelo físico:
  - Definición de las condiciones iniciales del caso, identificando los fenómenos físicos que pretenden modelarse.
  - Análisis teórico de las ecuaciones que intervendran en la resolución del problema.
  - Métodos utilizados para resolver sistemas complejos.

- Simulación por ordenador:
  - Análisis de las herramientas disponibles, seleccionando el más conveniente para el trabajo que se desea realizar.
  - Comprender cómo funciona OpenFOAM, realizando diferentes casos descritos.
  - Definición del modelo geométrico que se va a experimentar y discretización del dominio.
  - Adecuar las propiedades de los flujos, tiempo de simulación, parámetros de salida, etc. ejemplo que más se aproxime a las condiciones del caso que se quiere analizar.
  - Obtener una buena estabilidad numérica, garantizando la convergencia en elproceso iterativo. Consiguiendo, además, la independencia de la malla, es decir, el error numérico disminuye con el aumento del número de nodos,cuando las soluciones numéricas que se obtienen en diferentes mallados, coinciden con una tolerancia se dice que son independientes de la malla [9](Ferziger J.H., Perić M.; "Computational Methods for Fluid Dynamics"; 3rd Edition; Ed.: Springer; New York, 2002).
  - Vereficar los resultados con los obtenidos en el ensayo.

- Preparación del ensayo:
  - Diseño de la compuerta, del sistema de apertura y de la fijación del pistón al canal.
  - Diseño de la cámara, con una pared abierta por el fondo para dejar pasar el agua y una tubería unida en la parte superior. En la tubería se colocan diferentes diafragmas para hallar la potencía extraida. 
  - Sensores necesarios para la adquisición de datos.
  - Monitorizar y registrar las mediciones de los sensores para comparar los resultados con los de la simulación.

- Comparación de resultados:

  - Es necesario destacar que los diafragmas sustituyen la turbina, colocada para la extracción de energía real, dado que dicho análisis no es objeto de este proyecto; así mismo, los flujos de aire que se obtendrán son demasiado pequeños y con una transitoriedad prácticamente nula, con lo que sería más apropiado otro tipo de ensayo donde se dispusiera una generación de olas continuas. 
  - Así mismo, la utilización de los diafragmas, como más adelante se detallará, permiten obtener el caudal a partir de una medida de presión manométrica y un Coeficiente de Descarga. Para, de ahí, obtener la potencia.
  - Por otro lado, de las simulaciones se obtendrán las mismas variables, procurando adaptar lo mejor posible las condiciones y el modelo del ensayo, con diferentes herramientas no comerciables, de código abierto y gratuitas. 

  ​