---
linktitle: "[GEA] Waves"
title: "Waves"
keywords: 

publishdate: 2016-01-01
date: 2016-01-04

por:
 - name: "Lewi"
   ehu: "lmaiztegi001"
   github: "lmaiztegi001"
   group: "Alumnado [Mecánica]"
ama:
 - name: "1138-4EB"
   ehu: "umartinez012"
   github: "1138-4EB"
   group: "Alumnado [Electrónica]"
 - name: "Arantza"
   ehu: ""
   github: ""
   ext:
   group: "Profesorado [ISA]"
 - name: "Joseba"
   ehu: ""
   github: ""
   ext: 
   group: "Profesorado [ISA]"

fechas:
 det: "false"
 
areas: [ "Electrónica analógica" , "Electrónica digital" , "Programación microcontroladores" , "Arduino" , "Control de motores" , "Regulación automática" , "Diseño CAD" , "Diseño electrónico" , "Programación en ___" , "Matlab" ]

---

# Descripción

En el laboratorio de Ingeniería Nuclear y Mecánica de Fluidos de la Escuela se dispone de un tanque para la generación de olas y el estudio de las técnicas asociadas a las mismas (modelización de las mismas y ensayo de los diferentes prototipos de aprovechamiento de la energía undimotriz).

Tomando como referencia una [presentación](http://www.udc.gal/iuem/documentos/doc_xornadas/anaeco/APROVEITAMENTODAENERXIADASOLAS.pdf) de Tecnalia sobre la situación y futuro de las energías de las olas, donde se hace mención a la metodología a seguir para el desarrollo de convertidores, y adaptándolo al trabajo que se pretende realizar, queda de la siguiente manera:

1. **Modelo de Validación**: Obtener las características funcionales, así como un modelo matemático representativo. De modo que se pueda validar mediante un cálculo computacional y un ensayo experimental.
2. **Modelo de Diseño**: Esta fase servirá para verificar la dinámica del captador, las prestaciones que puede dar, su geometría, la respuesta ante diferentes tipos de olas, los esfuerzos máximos, el control del sistema,... 
3. **Modelo de Proceso**: Reunidos los datos del modelo y del dominio, se procede al análisis computacional. Permitiendo obtener los valores de presiones y velocidades de los flujos.
4. **Prototipo**: Disponiéndose del control del tanque de olas, se procede a la fabricación del modelo que valide a escala todo el conjunto.

# Contexto, antecedentes y justificación

La idea surgió del interés del alumno por explorar la energía del mar, fuente de aprovechamiento inagotable y que cuenta con un desarrollo notable sobre todo en Escocia. Así mismo, como en el laboratorio se dispone del montaje de un tanque para la producción de oleaje, se propuso experimentar un modelo en particular, adecuado para las zonas cercanas a la costa del País Vasco y también para el ensayo.

La tecnología a utilizar se denomina columna de agua oscilante (OWC, Oscilating Water Column), actualmente considerada la más madura para el aprovechamiento energético de las olas. Además, nuestro país ya cuenta con este tipo de [instalación](http://www.caminospaisvasco.com/Profesion/Obras/central-oleaje-mutriku/central-oleaje) desde julio del 2011 en Mutriku, siendo la primera del mundo con configuración de más de una turbina. La empresa encargada de desarrollar esta tecnología fue la escocesa Wavegen.

Junto con esto, existen numerosos proyectos de universitarios e investigadores que servirán de inspiración y de aprendizaje en la materia, como por ejemplo el trabajo por dos alumnos de la Universidad de [Wisconsin Madison](http://owcwaveenergy.weebly.com/).

La importancia de este proyecto recae en la necesidad de generar suministro eléctrico evitando contaminar el medio ambiente, queriendo ser parte del fomento de nuevas tecnologías capaces de crear empleo y aumentar el bienestar de las personas. No obstante, como está aún en desarrollo, lo que se pretende es despertar el interés entre el alumnado, elaborando un prototipo y unas pautas a seguir para validar las simulaciones mediante un caso real. Dando así cabida a ejemplos más atractivos para la asignatura de Mecánica de Fluidos o CFD.

El funcionamiento de una instalación OWC para el aprovechamiento de las olas es sencillo y como se a citado anteriormente, totalmente inocuo para el entorno. Cuando la ola llega, el nivel de agua asciende por el interior de las cámaras, comprimiendo el aire que hay en el interior y expulsándolo a través de una pequeña apertura superior. Esto hace que el aire comprimido salga a gran velocidad, provocando el giro de las turbinas. Cuando el nivel de agua desciende, crea un vacío en el interior de la cámara succionando aire a través de la apertura superior, impulsando nuevamente las turbinas. El diseño de las mismas hace que giren en el mismo sentido independientemente de la dirección del aire. Por tanto, es el propio aire comprimido el que acciona las turbinas, y no directamente el agua del mar. Los generadores eléctricos conectados a las turbinas, producirán la energía eléctrica. 

Se dispone de:

- Un motor de corriente continua con su correspondiente etapa de potencia  (driver) para mover la pala. Dispone de una consigna de entrada con módulo `±2,5V` y un offset de `5V`. Se desconocen el modelo de motor y las características y topología del driver.
- Tarjeta de adquisición por USB basada en microcontrolador ([Labjack U3](http://labjack.com/u3)), de la que se utilizan tres entradas analógicas de rango `0–2,36V` y una salida de rango `0–5V`.
- Sensor resistivo lineal de posición de `XXcm` y `XKXX`, con un divisor de tensión pasivo (`XKXX/XKXX`) para adaptar la salida al rango de entrada de la tarjeta.
- Dos sensores de distancia ultrasónicos con un rango de medida de `XXX-XXXmm` y salida de rango ``, adaptadas a la entrada de la tarjeta con conversores pasivos (`XKXX/XKXX`).

Los requisitos del cliente son:

- Disponer de diferentes trayectorias para generar varios tipos de ola caracterizadas por su amplitud, longitud de onda, periodo.
- Poder monitorizar y registrar los tres sensores para el análisis posterior de los datos de experimentación.
Poder guardar y cargar configuraciones definidas por el usuario para reproducir experimentos con la misma ola..
- Disponer de una interfaz gráfica (GUI) para interactuar con el sistema y abstraer al usuario del sistema de control.

Sin un estudio previo de las características dinámicas del sistema, a mediados de abril de 2014 se diseña una aplicación básica en Labview (National Instruments) con las siguientes características:

- Selección de diferentes tipos de trayectoria (forma senoidal/cuadrada/triangular, amplitud `0–10cm` y frecuencia `0–10Hz`).
- Controlador PID para reducir el error entre la referencia y la posición leída por el canal analógico `X`, que actúa en el driver mediante la DAC `X`.
- Monitorización de las variables de consigna, posición y salida de control por un lado, y de los sensores de distancia por otro.

Antes de proceder al control en lazo cerrado, se ejecutan el [panel de test](http://labjack.com/support/software) de LabJack y la aplicación en un portátil `Satellite-C660` con `Windows 7`, conectando las entradas/salidas selectivamente. Se validan los resultados de lectura a través de los canales analógicos por separado. Al comprobar la respuesta del motor a las variaciones manuales en la consigna del driver, se detecta que existe una latencia notable (de al menos un segundo).

Se realizan varias pruebas de (auto)ajuste del controlador (`Kp`, `Ki`, `Kd` y `Ts`), obteniéndose resultados oscilantes prácticamente independientes de los parámetros. Se concluye que no es posible un control causal, puesto que los retardos en el lazo de control compuesto por `Windows 7` + `tarjeta USB` + `driver` impiden la ejecución en [tiempo real](http://es.wikipedia.org/wiki/Tiempo_real) y la latencia de comunicación es muy superior al tiempo de computación. Aunque el carácter oscilante del sistema ante una entrada constante pudiera parecer adecuada para la aplicación buscada, es importante resaltar que se trata de una oscilación difícilmente controlable, por lo que se reduce la configurabilidad para obtener diferentes tipos de ola.

Se confirman las conclusiones con el alumno que realizó la primera programación en el marco de un convenio de Cooperación Educativa y con personas entendidas en el diseño de sistemas de control. Se plantean varias soluciones de implementación para garantizar el cumplimiento de los requisitos establecidos por el cliente:

- Mantener el lazo de control en un equipo con Windows 7
  - Control 	predictivo. Existen técnicas avanzadas (y complejas) de control para regular sistemas con latencias largas y variables. Sin embargo, teniendo en cuenta la aplicación buscada, resulta excesivamente costoso su desarrollo analítico.
  - Control 	“pseudo-predictivo”. La tarjeta LabJack U3 está basada en un 	microcontrolador. Aunque éste no es programable por completo, sí permite utilizar alguno de los contadores para generar pulsos en el rango de los ms. Mediante un estudio en profundidad de las librerías (en C o VIs de bajo nivel) y un análisis empírico exhaustivo, pueden compensarse parcialmente la variabilidad y longitud del retardo en el lazo.

El algoritmo a computar es realmente simple, por lo que su ejecución es trivial en comparación con cómo el sistema operativo ordena la prioridad de los procesos. En este sentido, los sistemas anteriores tienen una fuerte dependencia del equipo que se utilice, y pueden requerir un re-estudio prácticamente completo y/o el ajuste del propio sistema operativo para reducir conflictos. Su uso puede frustrar las posibilidades de personalización del tipo de ola, ya que se utilizan todos los recursos para rozar el límite de estabilidad del sistema y no queda mucho margen de mejora.

- Implementar el lazo de control en un dispositivo que funcione en tiempo real, y utilizar un segundo dispositivo para tareas de usuario (configuración y monitorización). Tanto [Labview Real-Time](http://www.ni.com/labview/realtime/esa/) de National-Instruments como [Real-Time Windows Target](http://www.mathworks.es/products/rtwt/) y [xPC Target](http://www.mathworks.es/videos/introduction-to-xpc-target-87481.html) de Mathworks son herramientas muy utilizadas para el prototipado rápido de sistemas de control en tiempo real. Permiten diseñar en un mismo entorno las funciones de control y las de monitorización/gestión, y después que se ejecuten en dispositivos separados sincronizados mediante Ethernet, RS-232, USB… Ofrecen la mayor flexibilidad y un tiempo de desarrollo rápido para un sistema robusto, aunque no óptimo. El dispositivo crítico, aquel que ejecuta el lazo de control, puede ser:
  - PC con un sistema operativo en tiempo real. Mayor coste (aunque puede reutilizarse un equipo viejo), mayor consumo, alta capacidad de computación y máxima capacidad de almacenamiento de datos.
  - Microcontrolador. Menor coste, consumo muy reducido, capacidad de computación suficiente y almacenamiento suficiente.
  - FPGA. Coste medio, mínimo consumo, alta capacidad de computación y almacenamiento suficiente.
- Implementar tanto el lazo de control como las tareas de configuración y monitorización en un único dispositivo que funcione en tiempo real y disponga de una pantalla y teclado -o pantalla táctil-, y un puerto USB o zócalo para tarjeta de memoria -lo que se denomina [sistema embebido](http://en.wikipedia.org/wiki/Embedded_system)-.
  - Microcontrolador. Menor coste, consumo reducido, capacidad de computación justa y almacenamiento suficiente. Tiempo de desarrollo rápido aunque con flexibilidad limitada.
  - FPGA con Microcontrolador empotrado (SoC). Coste medio, mínimo consumo, alta capacidad de computación, almacenamiento suficiente. Máxima flexibilidad, aunque es necesario un perfil específico para un tiempo de desarrollo contenido.

Tras valorar las opciones, se implementa un prototipo funcional en una [Arduino Diecimila](http://arduino.cc/es/Main/ArduinoBoardDiecimila) -cuyo núcleo es un microcontrolador [Atmega168](http://www.atmel.com/devices/atmega168.aspx) de Atmel-. Las características de esta placa no se diferencian mucho de las del LabJack U3. Sin embargo, el [éxito](http://www.economist.com/node/21540392) del [proyecto](http://www.forbes.com/sites/tjmccue/2012/12/18/how-to-program-arduino-the-easy-way-with-arno-kit/) Arduino, con más de 11 millones de resultados de búsqueda en Google, y la defensa del [Software Libre](http://es.wikipedia.org/wiki/Software_libre) y el [Hardware Libre](http://es.wikipedia.org/wiki/Hardware_libre), resultan muy adecuados para el contexto educativo de este proyecto. Además, la diferencia de precio es muy significativa, siendo el de Arduino de 10-25€ a pocos metros de la Escuela ([modpc.com/arduino-compatible](http://www.modpc.com/articulo/W09B/arduino-compatible-placa-programable-atmega328p-pu), [modpc.com/arduino-nano](http://www.modpc.com/articulo/V0CH/arduino-usb-nano-v3.0-avr-atmega328-p-20au)), frente a los aproximadamente 90€ del [LabJack](http://dikoin.com/fab/labjack/u3/). Adicionalmente, al ser una plataforma abierta, para reducir costes de producción puede diseñarse una placa a partir del modelo de referencia, y en cualquier caso la flexibilidad de programación es mucho mayor.

Para reducir el desarrollo del prototipo a dos días y validar en una semana que un microcontrolador es suficiente para un control robusto, en mayo de 2014 el controlador se escribe en un [sketch](http://arduino.cc/es/Tutorial/Sketch) de Arduino. Se utiliza la [librería Timer1](http://playground.arduino.cc/Code/Timer1) para garantizar el periodo de ejecución del lazo de control y se modifica la [librería PID](http://playground.arduino.cc/Code/PIDLibrary) para optimizar el peso del programa. También se describen trayectorias básicas: senoidales, triangulares y cuadradas, de amplitud y frecuencia fijas. Se escribe una comunicación serie-USB básica para arrancar el sistema -r-, pararlo -s-, cambiar el tipo de trayectoria -m0, m1 o m2, respectivamente-, y cambiar los parámetros del PID -p00.00, i00.00 y d00.00-. Al mismo tiempo, en cada iteración la placa devuelve el valor de consigna, posición y salida. El tiempo de muestreo se establece en 10ms. El sketch funcional puede consultarse en “sketch_tanqueolas.ino”.

Se realiza el montaje indicado en `tanqueolas_bb.pdf` y `tanqueolas_esquema.pdf` (*los valores indicados por las resistencias de la parte superior no se corresponden con los utilizados en el montaje*). Cabe indicar que el conector de cinco contactos representa los puntos de lectura para un osciloscopio, o para utilizar la Labjack U3 en paralelo para verificación. Sin embargo, como se indicará más adelante, la conexión de ésta provoca variaciones en las lecturas y finalmente sólo se lee de forma analógica la señal de posición del motor. En el script `graph_matlab.m` puede verse un ejemplo de cómo leer y graficar los datos devueltos por el puerto USB mapeado como `COM`.

Se valida el prototipo comprobando que el motor responde causalmente a diferentes trayectorias y ajustes del controlador. Se comprueba que mediante los parámetros del controlador puede llevarse a la planta desde un movimiento lento y controlado hasta a oscilaciones en el límite de la estabilidad.

A continuación se exponen consideraciones con respecto al hardware que podrían acelerar el tiempo de desarrollo y mejorar la robustez del sistema:

- El recorrido de la pala en el tanque es muy reducido en relación a las dimensiones de la misma y del motor. Debido al diseño de la transmisión, para lograr un movimiento oscilante el motor debe girar en ambos sentidos alternativamente y con periodos relativamente cortos. Por este hecho, desde el punto de vista del control, se observan dos aspectos críticos:
  - La unión entre el eje del motor y el tornillo que convierte en lineal el movimiento rotario sufre fuertes fatigas en cada cambio de sentido, mayores cuanto mayor sea la frecuencia, o más aceleración se requiera. Este hecho provoca desgaste y con el tiempo se producen holguras. Éstas se traducen en retardos variables en la respuesta del sistema y debe considerase su impacto.
  - Aún sin conocer la topología del driver de potencia, debe variarse el sentido de circulación de la corriente por el devanado del motor para modificar el sentido de giro. Esto provoca corrientes encontradas y pérdidas. Parte de la energía se traduce en frenado, y otra parte puede aprovecharse mediante sistemas de recuperación. Cualquiera de estas soluciones implica un retardo en el cambio de sentido de giro. No puede ser tan rápido como lo es un cambio de velocidad. Con mayor o menor retardo, implica esperar a frenar el motor e iniciar el giro en el sentido contrario, debiendo tener en consideración la inercia del agua al calcular el par de arranque.

Por lo anterior, sin profundizar en la complejidad mecánica, puede mejorarse la robustez y durabilidad del sistema modificando la transmisión para que el movimiento rotatorio del eje del motor se traduzca en movimiento oscilatorio y no lineal. El control de posición (típicamente bipolar) se traduce en control de velocidad (típicamente unipolar), y se reducen los retardos introducidos por el arranque/cambio de sentido. Una relación de engranajes adecuada puede redundar en un máximo aprovechamiento del régimen óptimo de trabajo del motor.

- Independientemente de las consideraciones anteriores, para definir adecuadamente los parámetros del controlador (Kp, Ki, Kd,y Ts), es necesario obtener un [modelo del sistema](http://sourceforge.net/projects/ohkis/files/anie/doc/Karrera%20Amaierako%20Proiektua.pdf/download):
  - Numérico: cuantificación, resolución, rangos...
  - Ancho de banda en lazo abierto y cerrado
  - Latencias y retardos: filtros, driver, adquisición, computación…

Pueden utilizarse técnicas de autotuning para facilitar el ajuste. O autotuning online (adaptive) para mejorar la respuesta ante el efecto del agua.
Teniendo en cuenta las características del sistema, es importante evitar sobreamortiguaciones antes cambios en la referencia. Como se ha explicado antes, los cambios de sentido introducen retardos por la necesidad de parar y volver a arrancar el motor. Las configuraciones sobreamortiguadas pueden provocar avances intermitentes del motor y grandes consumos.
Por otro lado, si la consigna requiere un cambio rápido, a veces el driver no es capaz de dar potencia suficiente y se bloquea, siendo necesario reiniciar el sistema.

- Los filtros y adaptadores pasivos utilizados entre los sensores y el controlador pueden perder fiabilidad si se conectan dispositivos de lectura (osciloscopios, voltimetros…). Dado el carácter didáctico del proyecto, puede ser interesante diseñar filtros y adaptadores activos (típicamente con amplificadores operacionales, utilizando topologías clásicas como [Sallent-Key](http://es.wikipedia.org/wiki/Filtro_de_Sallen-Key)). Al mismo tiempo, se puede considerar ajustar el rango de las señales a `0–3,3V` o `5V`, dependiendo de la placa que se utilice. Valorar la necesidad de una DAC integrada para las oscilaciones más rápidas o si es suficiente con PWM+filtro.

- A la hora de llenar el tanque de agua, es importante tener en cuenta el rango de lectura de los sensores de altura para evitar saturaciones y, por tanto, lecturas incompletas.

Se plantea la posibilidad de extraer varios TFG y pequeños proyectos de experimentación:

- I. Electrónica y/o Informática
  - Valorar si Arduino es la plataforma adecuada para el producto final, si es más adecuado el uso de otro microcontrolador (PIC, por ejemplo), o se prefiere optar por un SoC en FPGA.
  - Desarrollar la programación del prototipo para optimizar el código y omitir librerías innecesarias, obteniendo como resultado un diseño a bajo nivel (en C, casi ensamblador) con temporizaciones medidas.
  - Desarrollar la comunicación serie y diseñar una GUI para la interacción del usuario.
  - Implementar la posibilidad de guardar y cargar configuraciones predefinidas para poder reproducir experimentos.
- II. Electrónica
  - Estudiar los filtros y adaptadores para mejorar sus características, y diseñar una shield con componentes SMD de tamaño similar a la Arduino Nano, para adaptarla a ésta o a cualquier placa de tamaño similar que se utilice. O diseñar una placa basada en Arduino que integre los filtros y adaptadores.
  - Fabricar la placa diseñada.
- III. Regulación y control
  - Estudiar el sistema y obtener un modelo aproximado (incluyendo todos los elementos del lazo de control) para ajustar el tiempo de muestreo y los parámetros del PID.
  - Estudiar algoritmos de control que mejoren el rendimiento del PID.
- IV. Mecánica y Electrónica
  - Estudiar el régimen de funcionamiento del motor y obtener un modelo.
  - Diseñar un sistema de transmisión que permita el funcionamiento del motor en un solo sentido de giro, es decir, que convierta el movimiento rotatorio en oscilaciones lineales.
  - Modificar las consignas/trayectorias y los ajustes del PID para implementar un control de velocidad y no de posición.

# Objetivos
  
## General

Desarrollar un proyecto relacionado con la Mecánica de Fluidos, ampliando los conocimientos de la misma. Elaborar un estudio computacional del comportamiento del prototipo teniendo en cuenta las condiciones que se disponen en el laboratorio para validarlo mediante un ensayo. 

Tener una mayor perspectiva de cómo aprovechar la energía de las olas, centrando el estudio en el modelo de columna de agua oscilante. Adquirir soltura con el programa de simulación computacional Star CCM+ y su alternativa en software libre OpenFOAM realizando las pruebas y cambios adecuados dando con las soluciones que comparadas con el experimento del laboratorio convergen debidamente. 

## Específicos

Con el tanque a punto para la simulación de olas, se desea dar la posibilidad de ensayar el funcionamiento de un captador OWC. Analizar las condiciones especificadas en los contornos del dominio, para resolver de manera computacional las ecuaciones de los fluidos en la región. Además, la concreción de los pasos del cálculo por ordenador conlleva adquirir gran destreza, haciendo que la solución se aproxime a lo experimentado a escala. 

# Resultados esperados

*Son los medios necesarios para que se cumpla el objetivo específico. Se trata de metas concretas relacionadas con cada objetivo específico y que deben alcanzarse para que, al finalizar el proyecto, se cumplan los objetivos específicos marcados.*

# Actividades previstas

Análisis de la información disponible alrededor de el campo de las energías provenientes del mar. Obtención del modelo a introducir en el programa, y comprobación de resultados obtenidos.
Elaboración de un prototipo para experimentar lo que ocurre a una escala determinada.

*Las actividades son las acciones concretas que deben llevarse a cabo a lo largo del proyecto para que se consigan los resultados.*

*De este modo, cada uno de los resultados previstos en el proyecto debe tener asociadas una serie de actividades concretas (acciones) que es preciso poner en marcha para que se cumpla cada resultado.*

# Cronograma

Las simulaciones se prevén que sean costosas con lo que se estiman al rededor de tres meses de pruebas. Para el ensayo en principio contando con una semana de plazo para recopilar el material necesario, en un par más se confía en que sea suficiente. Así mismo, y ya que el proyecto requiere de demás documentos que completen los fundamentos y explicaciones, se necesitarán uno o dos meses más para finalizarlo.

*Es un diagrama que muestra las actividades previstas indicando la duración y dependencia temporal entre ellas. Se debe revisar y actualizar frecuentemente para incorporar los cambios y garantizar una correcta ejecución del proyecto.*

`www.ganttproject.biz`

# Recursos necesarios

*Si es necesario contar con recursos económicos, materiales, de infraestructura o de otro tipo para el desarrollo del proyecto, se hará un estimación de necesidades indicando con cuales de ellas se cuenta y cuales serían objeto de búsqueda de financiación o apoyo externo.*

*Para facilitar la gestión, se deberán exponer por bloques y se indicarán con un símbolo de exclamación “!” al inicio las que sean objeto de búsqueda.:*

- *Recursos de que dispone el GEA*
- *Recursos disponibles en la Escuela (7i27, Lab. II, Consejo de Estudiantes, Departamentos, Dirección…)*
- *Material a adquirir*
- *Gastos por desplazamiento de ponentes*
- *...*