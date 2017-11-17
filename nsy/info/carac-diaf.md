# Mediciones experimentales

1. Caracterización de la ola.
2. Altura del agua en el interior de la cámara
3. Caudal de salida, para calcular la potencia extraida, tras el paso del flujo por un diafragma. 

La norma **ISO 5167-2:2003** contempla la medición del caudal de fluidos mediante dispositivos de presión diferencial intercalados en conductos en carga de sección transversal circular. 

En la **Parte 2** se describen las *placas de orificio*; los detalles sobre la geometria, método de empleo de placas y medición del caudal. Así mismo, se condiciona su aplicación para flujos subsónicos, monofásicos, de diámetros comprendidos entre 50mm - 1000mm y números de Reynolds superiores a 5000. No siendo así, se procederá a la caracterización de diferentes diafragmas para hallar los *Coeficientes de descarga*.

# Ensayo: Caracterización del diafragma y medidas de presión

[Libro: "Mecánica de Fluidos y Máquinas Hidráulicas"; Claudio Mataix; 2ª Edición; 1982; Madrid] 

Los instrumentos para medir caudales se llaman caudalímetros, caracterizados por medir el flujo instantáneo, que puede variar de un momento a otro.

Para el ensayo se dispondrá un flujo cerrado, un *elemento depimógeno*, es decir, un elemento que provoca una caída de presión, y un *manómetro diferencial* para medir la diferencia de presiones. Un fluido que circula por un conducto cerrado experimenta una caída de presión que es funcíon de la velocidad.

Lo característico de una constricción o estrechamiento es que la caída de presión en la misma \Delta h es mayor que la pérdida de carga remanente \Delta hr.  Los caudalímetros de contricción más importantes y ya clásicos en la medida de caudales son: el Tubo de Venturi, las toberas y los diafragmas.

## Medida de caudal: Diafragma con sensor de presión

El diafragma, elaborado con una impresora 3D (Prusa i3) es una placa de plástico (PLA), con un orificio de diámetro *d* (**12.5mm**) concéntrico con el eje de la tubería de diámetro *D* (**19.6mm**). Por su sencillez  de construcción son muy usados para medir caudales tanto en líquidos como en gases. Resultan muy económicos de instalación, pero producen una pérdida de carga que es el 50% de la presión diferencial.

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

## Preparación del ensayo 

La elección de un medidor de flujo se ve afectada por la exactitud requerida, el intervalo de medición, el costo, la complicación, la facilidad de lectura o reducción de datos, así como la vida de servicio.

Cuando se tiene una obstrucción en el tubo, aparece un diferencial de presión. Esta caída de presión se puede correlacionar con la descarga mediante una calibración, y después se puede utilizar la curva presión-descarga para determinar la descarga leyendo la presión diferencial. Para ello se necesitará un flujo estable, así la ecuación de Bernoulli y la ecuación de continuidad servirán para determinar la descarga.

En el caso del diafragma, las líneas de corriente convergen para formar un área de flujo mínimo, "vena contracta", debido a que se desconoce este área, conviene usar el área de la obstrucción de diámetro d o D. Para considerar el efecto de la contracción y un coeficiente de velocidad se introduce un **coeficiente de descarga C**. Además, se emplea un **coeficiente de flujo K** que considera el coeficiente de descarga y la relación de áreas o diámetros de la obstrucción y la tubería. Un análisis dimensional revelaría que *C* y *K* dependen del número de Reynolds. 

La presión estática en la tubería puede medirse instalando un **piezómetro**; con el **tubo de Prandtl** se obtendrá la diferencia entre la presión total y la estática, y de ahí obtener la velocidad.

## Consideraciones para el diseño: Norma UNE-EN ISO 5167-2.03H

### Placas de orificio
#### Descripción

La parte de la placa dentro del conducto debe ser circular y concéntrica con el eje del conducto. Las caras de la placa deben ser planas y paralelas.

El diámetro *d* debe ser en todos los casos mayor que o igual a **12.5 mm**. La relación de diámetros *β = d/D* (**0.64**), debe ser siempre mayor que o igual a 0.10, y menor que o igual a 0.75.

* **Placas bidireccionales**

La placa de orificio se utilizará con flujos opuestos, entonces deben cumplirse los siguientes requisitos:

​	a) la placa no debe ser biselada

​	b) las dos caras deben cumplir con las especificaciones para la cara aguas arriba (apartado 5.1.3). Es decir, la placa puede considerarse plana cuando el máximo huelgo entre la placa y el canto recto de longitud *D*, tendido a través de cualquier diámetro de la placa, es menor de **0.005(D-d)/2**, es decir, la pendiente es menor de **0.5%** cuando la placa es examinada antes de intercalarla dentro de la línea de medida,

​	c) el espesor *E* de la placa debe ser igual al espesor *e* del orificio, (apartado 5.1.5) comprendido entre **0.005D y 0.02D** (0.098 a 0.392mm), además la diferencia entre los valores de e, medidos en cualquier punto del orificio, no debe ser mayor de **0.001D** (0.0196mm),

​	d) los dos cantos del orificio deben cumplir con las especificaciones para el canto aguas arriba (apartado 5.1.7). El canto aguas arriba no debe tener cantos rotos o protuberancias, debe estar bien marcado, se considera así si el radio del canto no es mayor de **0.0004d **(0.005).

#### Tomas de presión

Para cada placa de orificio, debe instalarse al menos una toma de presión aguas arriba y una toma de presión aguas abajo a D y D/2 (apartado 5.2). 

*Aguas arriba*: l1 = D ± 0.1D = **21.56mm**

*Aguas abajo*: l2 = 0.5D ± 0.01D = 9,996mm

El eje de la toma debe formar con el eje del conducto un ángulo tan próximo a 90º como sea posible. El orificio debe ser circular en el punto de perforación, los cantos deben estar al ras de la superficie interna de la pared del conducto y con acabado superficial lo más marcado posible. El diámetro de las tomas de presión debe ser menos de 0.13D (2.548 mm), y menor de 13 mm. Los ejes de las tomas de presión pueden situarse en cualquier plano axial de la tubería.

#### Coeficientes e incertidumbres
La rugosidad interna del conducto debe satisfacer la siguiente especificación: el valor de la desviación de la media aritmética del perfil de rugosidad, *Ra*, debe ser tal que 10⁴ Ra/D < 4.2, para un valor de ReD ≤ 10⁴.
Las consideraciones de este apartado no se seguirán, ya que se procederá a la caracterización del diafragma mediante un procedimiento experimental.

### Requisitos de instalación

* **Longitudes rectas mínimas aguas arriba y aguas abajo para instalaciones entre diversos accesorios y la placa de orificio**
  * Estas longitudes para los accesorios especificados en la instalación, sin acondicionadores del flujo, se muestran en la tabla 3.
  * Cuando no se utiliza un acondicionador del flujo, las longitudes especificadas en la tabla 3 deben considerarse como los valores mínimos. En particular, para trabajos de investigación y calibración, se recomienda que los valores aguas arriba especificados en la tabla 3 se incrementen por al menos un factor de 2, para minimizar la incertidumbre de medida.
  * Cuando las longitudes rectas utilizadas son iguales a o mayores que los valores especificados en las columnas A de la tabla 3 para “incertidumbre adicional cero”, no es necesario aumentar la incertidumbre del coeficiente de descarga para tener en cuenta el efecto de la instalación particular.

Para el caso particular del ensayo, se debe adecuar el diámetro del ventilador al diámetro del tubo *D*, para ello se colocará un reductor a una distancia de la placa de orificio, tomando el valor de la relación entre diámetros 0,67 (**0,64**), con "incertidumbre adicional cero" : 

*Aguas arriba*: L1 = 12xD = **235.2 mm**

*Aguas abajo*: L2 = 7xD = 137.2 mm

Para que el reductor cumpla una instalación aceptable deberá fabricarse con una relación de 2D a D (**38mm a 19,6mm**) sobre una longitud de 1,5D a 3D (29,4<**50mm**< 58,8).

* **Acondicionadores de flujo**

Un acondicionador del flujo puede utilizarse para reducir longitudes rectas aguas arriba, para el caso particular a ensayar, se utilizará para prevenir turbulencias aguas arriba. Dado que el diseño del ventilador (con un diámetro de eje grande en proporción al total) provocará vórtices en el flujo. 

Los acondicionadores del flujo sin patentar, que han cumplido el ensayo de conformidad de la Norma ISO 5167-1, son el enderezador del flujo de haz de 19 tubos (1998) y el acondicionador del flujo placa Zanker. No obstante, dada el reducido diametro del que se dispone se fabricará el de 8 paletas, patentado y descrito en el Anexo B.

El espesor de la pared debe ser menor que 0,025D, para que exista una igualdad en cuanto a uniformidad, diámetro exterior y espesor de pared. Además la longitud indicada será de 2D (**39.2 mm**) o 3D. 

* Instalación aguas abajo de cualquier accesorio
  En este caso, tras el reductor del ventilador, se tomará la medida para el enderezador del flujo de haz de 19 tubos, de modo que la distancia entre el extremo aguas abajo del acondicionador y la placa de orificio, sea igual a 13D ± 0,25D (254.8 ± 4.9 = 259.7 mm).






# Errores hallados


* Se trató de ensayar en un tubo con una relación de diámetros β = d/D = 12.5/113 = 0.11
* y un tubo menor β = d/D = 12.5/54 = 0.23 con un ventilador centrifugo (donde el aire cambia de dirección noventa grados) pero al realizar las mediciones con el Prandtl se dedujo que existían demasiados rebotes, con lo que las mediciones resultaban inestables. 
* Para evitar esto se procede a reducir la relación de diametros y así los rebotes del flujo por el paso a través del diafragma.


http://web.ift.uib.no/Teori/KURS/WRK/TeX/symALL.html

https://en.wikibooks.org/wiki/LaTeX/Mathematics