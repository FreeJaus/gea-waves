

# CANAL
- Bomba
- Regla para la medición de la altura dentro de la cámara 
- Pistón
- Medición de la presión, 
- Diafragmas caracterizados del ensayo anterior
- Tubería mas acomplamiento a la cámara

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

