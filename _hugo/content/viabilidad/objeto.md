---
title: "Objeto del trabajo"
keywords:
weight: 1

publishdate: 2016-01-01
date: 2016-01-01

---
En este Trabajo Fin de Grado se realizará la validación de un modelo numérico, de una ola a través de un canal, mediante simulación computacional, a partir de los resultados de un ensayo real en el laboratorio de Mecánica de Fluidos de la Escuela de Ingeniería de Bilbao. Este modelo servirá para su aplicación al estudio de captadores de Energía undimotriz de tipo Columna Oscilante de Agua (*Oscillating Water Column*, **OWC**). Adicionalmente, debido a las herramientas de software libre utilizadas, se comprenderá cómo funcionan los programas para el cálculo de la Dinámica de Fluidos por Ordenador (*Computational Fluid Dynamics*, **CFD**). Finalmente, dada la dificultad para encontrar documentación relativa a los cálculos de dicha tecnología, se generará una guía de usuario, especifica para hacer simulaciones relacionadas con este tipo de aplicaciones para el aprovechamiento de energía undimotriz.
<!--more-->

EEn general se tratará de profundizar en el área de la Mecánica de Fluidos, y en particular, en la rama de la Dinámica de Fluidos Computacional, la cual emplea métodos numéricos y algoritmos para estudiar y analizar problemas que involucran fluidos en movimiento [1].

Para ello, se hará un análisis de las tecnologías existentes para el aprovechamiento de la Energía del Mar. Clasificandolas según las formas en que se presenta la energía en el océano [2], ubicación e impacto medioambiental. Optando por el dispositivo OWC, como el más conveniente para el estudio e instalación, en un contexto de desarrollo sostenible.

Se comprenderán las bases y el desarrollo de la metodología empleada en el estudio computacional de la Dinámica de Fluidos, describiendo la implementación y resolución de las ecuaciones de conservación (para la masa, el momento y la energía) desde su formulación más general hasta el caso a ilustrar. Mostrando cómo programar los casos y qué algoritmos se emplean para la resolución más adecuada de las ecuaciones de Navier-Stokes usando el método de Volumenes Finitos.

Así mismo, se precisarán unos conocimientos básicos de programación, ya que, el software que se usará para resolver el código del caso, OpenFOAM, se ejecuta por terminal, sin interfaz gráfica. Adquiriendo una visión integral de las técnicas CFD y comprendiendo de forma más profunda qué ofrece un paquete comercial.

Se llevará a cabo la experimentación del caso, en el laboratorio del Centro, donde se dispone de un canal y un tanque de olas. Dada la complegidad adyacente a la generación de las olas, se empleará el canal, adaptándo su diseño a las condiciones que se van a simular. Es decir, se dispondrá de la estructura del canal con una pendiente positiva, que proyecte la aproximación del mar a las costas (donde normalmente están ubicadas estas estructuras), y se definirá una columna de agua en reposo, retenida por una compuerta, para que colapse en el instante inicial con el fin de visualizar el comportamiento de la superficie libre de líquido. Adicionalmente, para aproximar la simulación al modelo OWC se situará una pared al final del recorrido para hallar la altura oscilante de agua.

Por último, con el propósito de afianzar la destreza en la resolución de problemas  y en el razonamiento crítico a la hora de implementar las condiciones adecuadas para el caso que se desee ejecutar; se reunirán en una guía los pasos a seguir, analizando las posibilidades existentes hasta el momento para representar diferentes casos reales en CFD. Esto servirá para sintetizar y gestionar la información, ofreciendo un primer contacto con la simulación de flujos por ordenador, a falta de normas o códigos técnicos. 
