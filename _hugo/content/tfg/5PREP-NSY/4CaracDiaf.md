añadir altura mejor con regla por el reducido espacio dentro de la cámara

# 4 Ensayo: Caracterización del diafragma y medidas de presión

## 4.1 Objeto

La elección de un medidor de flujo se ve afectada por la exactitud requerida, el intervalo de medición, el costo, la complicación, la facilidad de lectura o reducción de datos, así como la vida de servicio. Para el caso particular del canal del laboratório, sólo se utilizará el montaje para esta ocasión, con lo que se realizarán modificaciones no permanentes. Además, los valores que se obtendrán estarán en escala muy reducida, por ello la forma más simple e intuitiva de hallar el caudal de salida será mediante una toma de presión aguas arriba del diafragma y el coeficiente de descarga del diafragma. 

Cuando se tiene una obstrucción en un tubo, aparece un diferencial de presión. Esta caída de presión se puede correlacionar con la descarga mediante una calibración, y después se puede utilizar la curva presión-descarga para determinar la descarga leyendo la presión diferencial. Para ello se necesitará un flujo estable, así la ecuación de Bernoulli y la ecuación de continuidad servirán para determinar la descarga.

En el caso del diafragma, las líneas de corriente convergen para formar un área de flujo mínimo, "vena contracta", debido a que se desconoce este área, conviene usar el área de la obstrucción de diámetro d o D. Para considerar el efecto de la contracción y un coeficiente de velocidad se introduce un **coeficiente de descarga C**. Además, se emplea un **coeficiente de flujo K** que considera el coeficiente de descarga y la relación de áreas o diámetros de la obstrucción y la tubería. Un análisis dimensional revelaría que *C* y *K* dependen del número de Reynolds. 

## 4.2 Método I

### 4.2.1 Descripción

Las primeras mediciones se realizan en el ensayo preparado para las prácticas de la asignatura de fluidos, [imgM1] con un ventilador (KLD012PP040GSWH) de $12V$ DC $0,09A$ al que se le puede variar las revoluciones por minuto, colocado en la parte central de una tubería de diámetro $113 mm$, abierta por ambos lados. En un extremo hay una tapa de apertura variable, que se tomará de referencia para sustituirla por una hecha con la impresora 3D, que contenga una apertura de $12,5 mm$, siguiendo las indicaciones de la norma. Además, cuenta con dos tomas de presión estática y un Tubo de Pitot.

ensayo en un tubo con una relación de diámetros *-+β = d/D = 12.5/113 = 0.11*

Se procederá a variar la altura del Tubo de Pitot para capturar diferentes medidas de la presión dinámica. Apartir de este dato, obtener la velocidad en función de la altura e integrando, dar con la velocidad media. Entonces, será posible hallar el caudal y la constante Kv.

//hallar la Función, distribución de velocidades para un fluido real
//Integrando el polinomio formado, hallar la contante, Kv:
//calculos

### 4.2.2 Consideraciones generales para el diseño: Norma UNE-EN ISO 5167-2.03H
En el apartado de la norma **5 Placas de orificio**, se describe el diafragma como:

La parte de la placa dentro del conducto debe ser circular y concéntrica con el eje del conducto. Las caras de la placa deben ser planas y paralelas.

El diámetro *d* debe ser en todos los casos mayor que o igual a $12,5 mm$. La relación de diámetros $\beta =d/D$, debe ser siempre mayor que o igual a **0.10**, y menor que o igual a **0.75**.

- **Placas bidireccionales**

La placa de orificio se utilizará con flujos opuestos, entonces deben cumplirse los siguientes requisitos:

​	a) la placa no debe ser biselada

​	b) las dos caras deben cumplir con las especificaciones para la cara aguas arriba (apartado 5.1.3 de la norma). Donde, la placa puede considerarse plana cuando el máximo huelgo entre la placa y el canto recto de longitud *D*, tendido a través de cualquier diámetro de la placa, es menor de **0.005(D-d)/2**, es decir, la pendiente es menor de **0.5%** cuando la placa es examinada antes de intercalarla dentro de la línea de medida,

​	c) el espesor *E* de la placa debe ser igual al espesor *e* del orificio, (apartado 5.1.5) comprendido entre **0.005D y 0.02D** __(0.098 a 0.392mm)__, además la diferencia entre los valores de e, medidos en cualquier punto del orificio, no debe ser mayor de **0.001D** __(0.0196mm)__,

​	d) los dos cantos del orificio deben cumplir con las especificaciones para el canto aguas arriba (apartado 5.1.7). El canto aguas arriba no debe tener cantos rotos o protuberancias, debe estar bien marcado, se considera así si el radio del canto no es mayor de **0.0004d** __(0.005)__.

### 4.2.3 Datos y Lecturas

La relación de diámetros: $\pm\beta = d/D = 12,5/113 = 0,11$



### 4.2.4 Conclusiones

## 4.3 Método II

### 4.3.1 Descripción

* y un tubo menor β = d/D = 12.5/54 = 0.23 con un ventilador centrifugo (donde el aire cambia de dirección noventa grados) pero al realizar las mediciones con el Prandtl se dedujo que existían demasiados rebotes, con lo que las mediciones resultaban inestables. 
* Para evitar esto se procede a reducir la relación de diametros y así los rebotes del flujo por el paso a través del diafragma.

### 4.3.2 Datos y Lecturas

### 4.3.3 Conclusiones

## 4.4 Método III

### 4.4.1 Descripción

La presión estática en la tubería se medirá instalando un **piezómetro**; con el **tubo de Prandtl** se obtendrá la diferencia entre la presión total y la estática, y de ahí obtener la presión dinámica. Entonces, será posible hallar la velocidad del flujo y con ello, el caudal, el coeficiente de descarga y el número de Reynolds serán valores conocidos.
- VEN001 de 12vcc
- VEN003 de 12vcc y caudal de 0.004 m³/s 
  Al tratarse de un ventilador para la electrónica, el caudal especificado se obtiene en la capa en contacto con el ventilador, al conectarlo a una tubería, sin importar de que longitud sea esta, se obtiene un caudal más bajo de lo esperado. Esto es consecuencia de las perdidas que se generan y, por tanto, la curva de funcionamiento corresponde a muy poco caudal respecto de 

### 4.4.2 Diseño.... 

#### 4.4.2.1 Tomas de presión

Apartado de la norma: 5.2

Para cada placa de orificio, debe instalarse al menos una toma de presión aguas arriba y una toma de presión aguas abajo a D y D/2 (apartado 5.2). 

*Aguas arriba*: l1 = D ± 0.1D __= **21.56mm**__

*Aguas abajo*: l2 = 0.5D ± 0.01D __= 9,996mm__

El eje de la toma debe formar con el eje del conducto un ángulo tan próximo a 90º como sea posible. El orificio debe ser circular en el punto de perforación, los cantos deben estar al ras de la superficie interna de la pared del conducto y con acabado superficial lo más marcado posible. El diámetro de las tomas de presión debe ser menos de 0.13D (__2.548 mm__), y menor de 13 mm. Los ejes de las tomas de presión pueden situarse en cualquier plano axial de la tubería.

- Coeficientes e incertidumbres
  La rugosidad interna del conducto debe satisfacer la siguiente especificación: el valor de la desviación de la media aritmética del perfil de rugosidad, *Ra*, debe ser tal que 10⁴ Ra/D < 4.2, para un valor de ReD ≤ 10⁴.
  Las consideraciones de este apartado no se seguirán, ya que se procederá a la caracterización del diafragma mediante un procedimiento experimental.

####4.4.2.2 Requisitos de instalación

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
####4.4.2.3 Acondicionadores de flujo

Un acondicionador del flujo puede utilizarse para reducir longitudes rectas aguas arriba, para el caso particular a ensayar, se utilizará para prevenir turbulencias aguas arriba. Dado que el diseño del ventilador (con un diámetro de eje grande en proporción al total) provocará vórtices en el flujo. 

Los acondicionadores del flujo sin patentar, que han cumplido el ensayo de conformidad de la Norma ISO 5167-1, son el enderezador del flujo de haz de 19 tubos (1998) y el acondicionador del flujo placa Zanker. No obstante, dada el reducido diametro del que se dispone se fabricará el de 8 paletas, patentado y descrito en el Anexo B.

El espesor de la pared debe ser menor que 0,025D, para que exista una igualdad en cuanto a uniformidad, diámetro exterior y espesor de pared. Además la longitud indicada será de 2D (**39.2 mm**) o 3D. 

* Instalación aguas abajo de cualquier accesorio
  En este caso, tras el reductor del ventilador, se tomará la medida para el enderezador del flujo de haz de 19 tubos, de modo que la distancia entre el extremo aguas abajo del acondicionador y la placa de orificio, sea igual a 13D ± 0,25D (254.8 ± 4.9 = **259.7 mm**).
  //
### 4.3.2 Datos y Lecturas

### 4.3.3 Conclusiones


## 4.6 Metodo final



http://web.ift.uib.no/Teori/KURS/WRK/TeX/symALL.html
https://en.wikibooks.org/wiki/LaTeX/Mathematics




Un fluido real posee determinada viscosidad y consecuentemente, la velocidad de desplazamiento de las partículas de fluido junto a las paredes del conducto es nula y empieza a aumentar a medida que se aleja de la pared hasta alcanzar un valor máximo, como se muestra en la figura (distribución de velocidades en un conducto)



