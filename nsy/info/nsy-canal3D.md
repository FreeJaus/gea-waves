# Ensayo final

En el laboratorio de Ingeniería Nuclear y Mecánica de Fluidos de la Escuela de Ingeniería de Bilbao, se dispone de un canal al que se le han realizado algunas modificaciones. Implementando un pistón hidráulico, que abrirá una compuerta haciendo que colapse el agua para formar una onda. y el montaje de la cámara  para experimentar el caso de interés.

## Preparación del ensayo

Se acondicionan todos los elementos en su lugar correspondiente, ajustando la compuerta del cilindro a **600mm** de la pared del fondo del depósito de entrada del agua. Así mismo, entre las dos posibilidades existentes para fijar la pared que delimitará la cámara, se opta por la que más recorrido dejará a la ola
- Accionamiento del pistón

  Este mecanismo tiene cuatro salidas que deberán estar conectadas de la siguiente manera:

  - Dos salidas se conectan a una tarjeta de adquisición por USB basada en un microcontrolador ([Labjack U3](http://labjack.com/u3)) para controlar la subida y bajada de la compuerta desde el ordenador y así capturar el tiempo de transición. 
  - Una a una placa que actúa como fuente de alimentación.
  - Por último, se conecta el inyector de aire a presión a una toma.

  Para accionar el cilindro, se desarrolla una aplicación (.vi) desde el programa "Ni LabVIEW 2015".

- Acionamiento de la bomba

  Se realizan dos llenados a diferentes alturas:

  - Con la compuerta subida, se llena hasta una altura de **45mm**.
  - Una vez bajada la compuerta de prosigue hasta haber llegado a**140mm**, en caso de pasarse, se cuenta con una llave de paso que vacie parte del agua.

- Medición 
## Obtencion de medidas
- Altura del agua en la cámara
- Presión estática 
