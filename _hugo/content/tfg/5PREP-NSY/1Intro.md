[en algún lado habré descrito que se van a comparar los datos de la presión manometrica a la salida, el flujo de salida y la altura del agua]

<Mediciones experimentales>

# 1. INTRODUCCIÓN

Realizada una búsqueda por la red de los experimentos elaborados para estudiar los prototipos OWC a escala, no se hallaron referencias que se adaptasen 

Se irán desarrollando diferentes modificaciones en el canal del laboratorio, para lograr visibilizar el funcionamiento del prototipo OWC  ya que no se hallaron referencias que se adaptasen completamente al caso de objeto.  Además, tras ver algunos resultados, será necesario repetir fases de la experimentación hasta ajustarse a unos valores que se aproximen a lo deseado. El objetivo general será obtener las siguientes variables en el transcurso del tiempo:

1. Altura del agua en el interior de la cámara.
2. Potencia extraida del flujo a la salida de la cámara.

El valor de la potencia, habiendo sustituido la turbina por un diafragma, corresponde al caudal que lo atraviesa por la diferencia de presiones a un lado y al otro. Para hallar el caudal, se descartó la posibilidad de usar un anemómetro, debido a que la escala es bastante pequeña como para medir velocidades de flujo apreciables. Además, al tratarse de un sólo impulso de una ola, no se garantiza la captura del valor máximo. 

//Cuando se tiene una obstrucción en un tubo, aparece un diferencial de presión. Esta caída de presión se puede correlacionar con la descarga mediante una calibración, y después se puede utilizar la curva presión-descarga para determinar la descarga leyendo la presión diferencial. [L.Mataix]

//La norma **ISO 5167-2:2003** contempla la medición del caudal de fluidos mediante dispositivos de presión diferencial intercalados en conductos en carga de sección transversal circular. Adicionalmente, en la **Parte 2** se describen las **placas de orificio**; los detalles sobre la geometria, método de empleo de placas y medición del caudal. Así mismo, se condiciona su aplicación para flujos subsónicos, monofásicos, de diámetros comprendidos entre 50 mm - 1000 mm y números de Reynolds superiores a 5000.

Aparte de esto, se deberá adaptar el canal existente, añadiendo las siguientes modificaciones:

- Incluir mecanismo para la apertura de una compuerta. Deberá soportar la altura de agua del instante inicial y permitir una apertura lo mas limpia y rápida posible.
- Añadir estructura que actúe como cámara. Anchura delimitada por las paredes del canal, que permita la entrada de agua por la parte inferior, la salida de aire por la parte superior y que soporte el impacto directo del agua pudiendo ser anidada al fondo del canal.
- Colocar una regla en la pared del canal. Centrada en la cavidad de la cámara para captar la media de la altura del agua.
- Acoplar una tubería en la salida de la cámara que haga de chimenea. Perforada para poder realizar la lectura de la presión.
- Fabricación de diferentes diafragmas.

# 2. FUNDAMENTO TEÓRICO

[Libro: "Mecánica de Fluidos y Máquinas Hidráulicas"; Claudio Mataix; 2ª Edición; 1982; Madrid] 

Los instrumentos para medir caudales se llaman **caudalímetros**, caracterizados por medir el flujo instantáneo, que puede variar de un momento a otro.

Para el ensayo se dispondrá un flujo cerrado, un **elemento deprimógeno**, es decir, un elemento que provoca una caída de presión, y un **manómetro diferencial** para medir la diferencia de presiones. Un fluido que circula por un conducto cerrado experimenta una caída de presión que es funcíon de la velocidad.

Lo característico de una constricción o estrechamiento es que la caída de presión en la misma \Delta h es mayor que la pérdida de carga remanente \Delta hr.  Los caudalímetros de constricción más importantes y ya clásicos en la medida de caudales son: el Tubo de Venturi, las toberas y los diafragmas.

## 2.1 Medida de caudal: Diafragma con sensor de presión

El diafragma, es una placa con un orificio de diámetro *d* concéntrico con el eje de la tubería de diámetro *D*. Por su sencillez  de construcción son muy usados para medir caudales tanto en líquidos como en gases. Resultan muy económicos de instalación, pero producen una pérdida de carga que es el 50% de la presión diferencial.

Aplicando Bernoulli para el fluido real, con pérdidas, entre las secciones 0 y 2:
$$
\frac{p_{0}}{\rho g}+z_{0}+\frac{v_{0}^2}{2g}-Hr_{0-2}=\frac{p_{2}}{\rho g}+z_{2}+\frac{v_{2}^2}{2g}
$$
Agrupando los términos de presión estática y cotas, la ecuación anterior queda así:
$$
(\frac{p_{0}}{\rho g}+z{0})-(\frac{p_{2}}{\rho g}+z_{2})=h_{0}-h_{2}=Hr_{0-2}+\frac{v_{2}^2}{2g}-\frac{v_{0}^2}{2g}
$$
Donde h_0-h_{2}, es la diferencia de alturas piezométricas entre las secciones 0 y 2.

Las pérdidas Hr_0-2 pueden expresarse como fracción de la velocidad v_1:
$$
Hr_{0-2}=\zeta \frac{v_{1}^2}{2g}
$$
Donde \zeta, es el coeficiente de pérdidas.

Como el fluido es incompresible, por continuidad se sabe que el caudal permanece constante, conocidos los diámetros la ecuación de continuidad queda:

$$
v_{0} \frac{\pi D^2}{4}=v_{1} \frac{\pi d^2}{4}=v_{2} \frac{\pi d_{2}^2}{4}
$$
Donde d_2 es el diámetro de la *vena contracta*. Por tanto:
$$
v_{0}=v_{1}(d/D)^2
$$
y
$$
v_{2}=v_{1}(d/d_{2})^2
$$
Llamando para simplificar:
$$
\alpha = d/d_{2}, \beta =d/D
$$
Sustituyendo:
$$
h_{0}-h_{2}=(\zeta+\alpha^4-\beta^4)\frac{v_{1}^2}{2g}
$$
Y despejando:
$$
v_1=\frac{1}{\sqrt{\zeta + \alpha ^4-\beta ^4}}\sqrt{2g(h_{0}-h_{2})}
$$

$$
Q=\frac{\pi d^2}{4}\cdot \frac{1}{\sqrt{\zeta +\alpha ^4-\beta ^4}}\sqrt{2g(h_{0}-h_{2})}
$$

2.2 FLUIDO REAL POR CONDUCTOS

Un fluido real posee determinada viscosidad y consecuentemente, la velocidad de desplazamiento de las partículas de fluido junto a las paredes del conducto es nula y empieza a aumentar a medida que se aleja de la pared hasta alcanzar un valor máximo, como se muestra en la figura 

[distribución de velocidades en un conducto]

**[Antoni Luszczewski; "Redes industriales de tubería. Bombas para agua, ventiladores y compresores. Diseño y construcción"; Ed: Reverte]

p8 *ec de bernoulli para un fluido real*
https://books.google.es/books?id=1k3qRVvyFRcC&pg=PT15&lpg=PT15&dq=tipo+flujo+ventilador+vortices&source=bl&ots=larkAQYJKh&sig=rQpNk3dL46YCj8xKmy6cBY3cqTs&hl=es&sa=X&ved=0ahUKEwjS-frJ3_zWAhWKYVAKHYKhDREQ6AEIVjAM#v=onepage&q=tipo%20flujo%20ventilador%20vortices&f=false

Así mismo, el parámetro primario que afecta a la transición de un flujo turbulento es el número de Reynolds:

0<Re<1; movimiento laminar "lento" altamente viscoso

parabola sólo si es flujo laminar Re<2300 el valor de diseño aceptado para tansiciones en tubos

[L.Mataix]

[[y había otra gráfica sobre esto para el estado del arte]] 

2.3 ECUACIÓN DE CONTINUIDAD

# 3. DESCRIPCIÓN DE EQUIPOS

## 3.1 Canal
Consta de una bomba para el llenado, PUMP CPm 132A, con un caudal de 20:120 l/min; y una llave de paso que permitirá ajustar la condición inicial del nivel del agua.

[img canal]

## 3.2 Apertura de la compuerta
Se fabrica una estructura de madera con un acabado impermeable, que se anide al canal y a un cilindro hidráulico. Además se pondrán unas juntas de goma para minimizar las fugas de agua. El pistón, **serie 453** de doble vástago, carrera de 160 mm, **ISO 15552**. 

- Presión de operación: 10 bar.
- Diámetro de POM (polyacetal) de 32 mm a 80 mm, luego la fuerza que es capaz de realizar:

$$
P_G=10 bar\simeq1000kPa=1000kN/m^2 \\
F=P_G·A=1000kN/m^2·[(80^2-40^2)\pi]=20,1kN
$$

Así mismo, del cálculo de compuertas planas se obtiene la fuerza que haría el volumen del agua, considerando el nivel máximo de llenado del canal:

[img diagrama de presiones]
$$
F_P=P_G·A=\frac{h}{2}·\gamma·b·h=9810\frac{N}{m^3}·\frac{0,25^2}{2}m^2·0,08m=24,525N\\
y_{CP}=y_{CG}+\frac{I_{XG}}{y_{CG}·A}=\frac{h}{2}+\frac{\frac{1}{12}b·h^3}{\frac{h}{2}·b·h}=\frac{2h}{3}\\
\sum M_C=0 \xrightarrow{}F_P·y_{CP}=F·0,16\xrightarrow{}F=25,547N
$$
Estos resultados no son direcramente comparables, ya que la fuerza del agua implicaría un momento en el eje del pistón, luego habría que comprobar el pandeo de dicho eje. No obstante, vista su capacidad se considera que está sobredimensionado para la función que va a cumplir, garantizándose también la rápida subida de la compuerta.

[Img pistón]

El accionamiento del pistón se lleva a cabo mediante un sencillo programa elaborado por el director del departamento con la herramienta Ni LabVIEW 2015 SPI. Para ello se conecta el accionamiento neumático del pistón a una tarjeta de adquisición LabJack U3-Lv; se alimenta conectado a una placa con una salida de 24V y 1,1A; y por último se conecta el inyector de aire a presión.

## 3.3 Cámara
Está fabricada con los mismos materiales que la estructura del pistón. 

[boceto]

La longitud del canal queda condicionada por los dos puntos de conexión que se disponen, seleccionando el de más longitud para darle tiempo al agua a que colapse y se forme la ola.

Por otro lado, la apertura del paso del agua por el fondo, en un principio se definió de 25 mm pero como en caso de querer ajustarse a esa medida habría que reducir la altura total de la cámara, se posiciona dejando 32 mm de paso.

[img cámara]

## 3.4 Chimenea
Se diseña una pieza mediante la impresora 3D para acoplar la tubería adaptada en el ensayo de caracterización de los diafragmas, a la salida de la cámara. Así mismo, se aprovecha la toma de presión, detallada en el mismo ensayo, para medir la presión estática del aire dentro de la cámara. El aparato de medida es un "Transductor de presión diferencial" marca Setra, modelo 267:

- Excitación: 24 VDC/VAC
- Salida: 0-10 VDC
- Serie: 1173078
- Rango: 0-100Pa

Se conecta la salida en otros puertos de la misma tarjeta de adquisición LabJack, utilizada para el accionamiento del pistón, para capturar los datos desde el ordenador. Ya que, conectado al display se tiene un paso delimitado por un intervalo que el ojo es capaz de apreciar, y , por las simulaciones, se sabe que para captar el máximo valor de presión, el paso del tiempo como mínimo debe ser de 0,05 seg. 

## 3.5 Diafragmas
Se toma el mínimo valor contemplado por la normativa de 12,5 mm para el primer modelo de diafragma. No obstante, dado que el diámetro de salida de la cámara es como máximo de 30 mm, no se cumplen las condiciones (de diámetro de flujo y número de Reynolds) para tomar un coeficiente de descarga ya definido. Por ello, se procederá a la caracterización de diferentes diafragmas para hallar los *Coeficientes de Descarga* correspondientes. Los diafragmas se elaboran con una impresora 3D con los siguientes diámetros: [8-9,5-11-12,5-14-15,5-16] mm.

## 3.6 Impresora 3D
Modelo **Prusa i3**, características:
- Tipo de plástico utilizado **PLA**: hecho a partir de materiales orgánicos y renovables, en el proceso de impresión se usa un diámetro de boquilla (*nozzle*) de 0.4 mm, el diámetro del filamento de 1.75 mm, anchura de capa de 0.2 mm (calidad normal) y densidad de relleno (*infill*) de 15%. Aunque se trate de mejorar la configuración de impresión, este material crea un paso visible entre las capas, luego el acabado superficial suele ser rugoso, pero es bastante resistente, apropiado para el prototipado y perfección de diseños finales. 
- Margen de impresión: x = 215 mm, y = 210 mm, z = 180 mm. Así mismo el margen de compensación que habrá que añadir a los diámetros interiores será de 0.4 mm. 
- Formato de entrada: para definir las características de impresión se utiliza el software CURA del que se obtiene un archivo *.gcode*, este programa necesita que los modelos estén en formato STL. Entre todas las alternativas, se selecciona el software paramétrico OpenSCAD. 

# 4. ACTIVIDADES A REALIZAR/PROCEDIMIENTOS

Primero se llevará a cabo la caracterización del diafragma, se prosigue con el montaje de las piezas que hay que añadir en el canal y se finaliza con la correcta disposición de los equipos de medida y accionamiento.

## 4.1 Ensayo: Caracterización del diafragma y medidas de presión

### 4.1.1 Objeto

La elección de un medidor de flujo se ve afectada por la exactitud requerida, el intervalo de medición, el costo, la complicación, la facilidad de lectura o reducción de datos, así como la vida de servicio.

Cuando se tiene una obstrucción en un tubo, aparece un diferencial de presión. Esta caída de presión se puede correlacionar con la descarga mediante una calibración, y después se puede utilizar la curva presión-descarga para determinar la descarga leyendo la presión diferencial. Para ello se necesitará un flujo estable, así la ecuación de Bernoulli y la ecuación de continuidad servirán para determinar la descarga.

//En el caso del diafragma, las líneas de corriente convergen para formar un área de flujo mínimo, "vena contracta", debido a que se desconoce este área, conviene usar el área de la obstrucción de diámetro d o D. Para considerar el efecto de la contracción y un coeficiente de velocidad se introduce un **coeficiente de descarga C**. Además, se emplea un **coeficiente de flujo K** que considera el coeficiente de descarga y la relación de áreas o diámetros de la obstrucción y la tubería. Un análisis dimensional revelaría que *C* y *K* dependen del número de Reynolds. 

La presión estática en la tubería se medirá instalando un **piezómetro**; con el **tubo de Prandtl** se obtendrá la diferencia entre la presión total y la estática, y de ahí obtener la presión dinámica. Entonces, será posible hallar la velocidad del flujo y con ello, el caudal, el coeficiente de descarga y el número de Reynolds serán valores conocidos.

### 4.1.2 Consideraciones para el diseño: Norma UNE-EN ISO 5167-2.03H

#### 4.1.2.1 Placas de orificio

##### Descripción

La parte de la placa dentro del conducto debe ser circular y concéntrica con el eje del conducto. Las caras de la placa deben ser planas y paralelas.

El diámetro *d* debe ser en todos los casos mayor que o igual a **12.5 mm**. La relación de diámetros *β = d/D*, debe ser siempre mayor que o igual a **0.10**, y menor que o igual a **0.75**.

* **Placas bidireccionales**

La placa de orificio se utilizará con flujos opuestos, entonces deben cumplirse los siguientes requisitos:

​	a) la placa no debe ser biselada

​	b) las dos caras deben cumplir con las especificaciones para la cara aguas arriba (apartado 5.1.3 de la norma). Es decir, la placa puede considerarse plana cuando el máximo huelgo entre la placa y el canto recto de longitud *D*, tendido a través de cualquier diámetro de la placa, es menor de **0.005(D-d)/2**, es decir, la pendiente es menor de **0.5%** cuando la placa es examinada antes de intercalarla dentro de la línea de medida,

​	c) el espesor *E* de la placa debe ser igual al espesor *e* del orificio, (apartado 5.1.5) comprendido entre **0.005D y 0.02D** __(0.098 a 0.392mm)__, además la diferencia entre los valores de e, medidos en cualquier punto del orificio, no debe ser mayor de **0.001D** __(0.0196mm)__,

​	d) los dos cantos del orificio deben cumplir con las especificaciones para el canto aguas arriba (apartado 5.1.7). El canto aguas arriba no debe tener cantos rotos o protuberancias, debe estar bien marcado, se considera así si el radio del canto no es mayor de **0.0004d** __(0.005)__.

##### Tomas de presión

Para cada placa de orificio, debe instalarse al menos una toma de presión aguas arriba y una toma de presión aguas abajo a D y D/2 (apartado 5.2). 

*Aguas arriba*: l1 = D ± 0.1D __= **21.56mm**__

*Aguas abajo*: l2 = 0.5D ± 0.01D __= 9,996mm__

El eje de la toma debe formar con el eje del conducto un ángulo tan próximo a 90º como sea posible. El orificio debe ser circular en el punto de perforación, los cantos deben estar al ras de la superficie interna de la pared del conducto y con acabado superficial lo más marcado posible. El diámetro de las tomas de presión debe ser menos de 0.13D (__2.548 mm__), y menor de 13 mm. Los ejes de las tomas de presión pueden situarse en cualquier plano axial de la tubería.

##### Coeficientes e incertidumbres
La rugosidad interna del conducto debe satisfacer la siguiente especificación: el valor de la desviación de la media aritmética del perfil de rugosidad, *Ra*, debe ser tal que 10⁴ Ra/D < 4.2, para un valor de ReD ≤ 10⁴.
Las consideraciones de este apartado no se seguirán, ya que se procederá a la caracterización del diafragma mediante un procedimiento experimental.

#### 4.1.2.2 Requisitos de instalación

* **Longitudes rectas mínimas aguas arriba y aguas abajo para instalaciones entre diversos accesorios y la placa de orificio**
  * Estas longitudes para los accesorios especificados en la instalación, sin acondicionadores del flujo, se muestran en la tabla 3.
  * Cuando no se utiliza un acondicionador del flujo, las longitudes especificadas en la tabla 3 deben considerarse como los valores mínimos. En particular, para trabajos de investigación y calibración, se recomienda que los valores aguas arriba especificados en la tabla 3 se incrementen por al menos un factor de 2, para minimizar la incertidumbre de medida.
  * Cuando las longitudes rectas utilizadas son iguales a o mayores que los valores especificados en las columnas A de la tabla 3 para “incertidumbre adicional cero”, no es necesario aumentar la incertidumbre del coeficiente de descarga para tener en cuenta el efecto de la instalación particular.
    //
    Para el caso particular del ensayo, se debe adecuar el diámetro del ventilador al diámetro del tubo *D*, para ello se colocará un reductor a una distancia de la placa de orificio, tomando el valor de la relación entre diámetros 0,67 (**0,64**), con "incertidumbre adicional cero" : 

*Aguas arriba*: L1 = 12xD = **235.2 mm**

*Aguas abajo*: L2 = 7xD = 137.2 mm

Para que el reductor cumpla una instalación aceptable deberá fabricarse con una relación de 2D a D (**38mm a 19,6mm**) sobre una longitud de 1,5D a 3D (29,4<**50mm**< 58,8).
//
##### Acondicionadores de flujo

Un acondicionador del flujo puede utilizarse para reducir longitudes rectas aguas arriba, para el caso particular a ensayar, se utilizará para prevenir turbulencias aguas arriba. Dado que el diseño del ventilador (con un diámetro de eje grande en proporción al total) provocará vórtices en el flujo. 

Los acondicionadores del flujo sin patentar, que han cumplido el ensayo de conformidad de la Norma ISO 5167-1, son el enderezador del flujo de haz de 19 tubos (1998) y el acondicionador del flujo placa Zanker. No obstante, dada el reducido diametro del que se dispone se fabricará el de 8 paletas, patentado y descrito en el Anexo B.

El espesor de la pared debe ser menor que 0,025D, para que exista una igualdad en cuanto a uniformidad, diámetro exterior y espesor de pared. Además la longitud indicada será de 2D (**39.2 mm**) o 3D. 

* Instalación aguas abajo de cualquier accesorio
  En este caso, tras el reductor del ventilador, se tomará la medida para el enderezador del flujo de haz de 19 tubos, de modo que la distancia entre el extremo aguas abajo del acondicionador y la placa de orificio, sea igual a 13D ± 0,25D (254.8 ± 4.9 = **259.7 mm**).
  //
### 4.1.3 Metodo I

Las primeras mediciones se realizan en el ensayo preparado para las prácticas de la asignatura de fluidos, [imgM1] con un ventilador (XX) al que se le puede variar las revoluciones por minuto, colocado en la parte central de una tubería de diámetro 113 mm, abierta por ambos lados. En uno de los lados hay una tapa de apertura variable, que se tomará de referencia para sustituirla por una hecha con la impresora 3D, que contenga un iris de 12,5 mm. Además, cuenta con dos tomas de presión estática y una donde se ha introducido un Tubo de Pitot.

Se trató de ensayar en un tubo con una relación de diámetros *-+β = d/D = 12.5/113 = 0.11*
KLD012PP040GSWH
12V DC 0.09A
**Calculos**

Se procederá a variar la altura del Tubo de Pitot para capturar diferentes medidas de la presión dinámica, de ahí, obtener la velocidad en función de la altura:

Integrando el polinomio formado, hallar la contante, Kv:

**Datos y Lecturas**

**Conclusiones**  

### 4.1.4 Metodo II
* y un tubo menor β = d/D = 12.5/54 = 0.23 con un ventilador centrifugo (donde el aire cambia de dirección noventa grados) pero al realizar las mediciones con el Prandtl se dedujo que existían demasiados rebotes, con lo que las mediciones resultaban inestables. 
* Para evitar esto se procede a reducir la relación de diametros y así los rebotes del flujo por el paso a través del diafragma.
### 4.1.5 Metodo III
- VEN001 de 12vcc
- VEN003 de 12vcc y caudal de 0.004 m³/s 
  Al tratarse de un ventilador para la electrónica, el caudal especificado se obtiene en la capa en contacto con el ventilador, al conectarlo a una tubería, sin importar de que longitud sea esta, se obtiene un caudal más bajo de lo esperado. Esto es consecuencia de las perdidas que se generan y, por tanto, la curva de funcionamiento corresponde a muy poco caudal respecto de 
### 4.1.3 Metodo final



http://web.ift.uib.no/Teori/KURS/WRK/TeX/symALL.html
https://en.wikibooks.org/wiki/LaTeX/Mathematics




Un fluido real posee determinada viscosidad y consecuentemente, la velocidad de desplazamiento de las partículas de fluido junto a las paredes del conducto es nula y empieza a aumentar a medida que se aleja de la pared hasta alcanzar un valor máximo, como se muestra en la figura (distribución de velocidades en un conducto)



