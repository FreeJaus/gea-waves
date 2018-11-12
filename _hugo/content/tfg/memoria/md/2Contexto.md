## Contexto

Con este trabajo se pretende realizar un análisis de las tecnologías existentes para el aprovechamiento del mar y, junto con ello, estudiar el principio de funcionamiento físico de un caso práctico. El estudio se realizará mediante simulación por ordenador y se experimentará en un ensayo real para verificar los resultados. 

Actualmente no se dispone de normativas o guías que describan con detalle las consideraciones a tener en cuenta para definir el modelo físico de un caso y simularlo. No obstante, existen técnicas para verificar que las simulaciones sean aceptables (el número de Courant, las tolerancias de las variables, los residuos, la estabilidad numérica o la dependencia de la malla).

La energía extraída de los océanos y mares son una fuente limpia e inagotable del recurso. Resulta una opción viable para paliar los problemas de la contaminación que se dan con otras fuentes de energía no renovables, sobre todo por la combustión de materiales fósiles que producen anhídrido carbónico.

Sin embargo, su desarrollo aún está limitado, en gran medida por la fuerte inversión económica que supone la creación de una central, los impactos ambientales que podría causar, alterando el ecosistema de los lugares donde se ubique. Por ello, buena perte de las investigaciones deberían centrarse, aparte de en cuestiones técnicas, en minimizar los costes financieros y rebajar el impacto medioambiental.

Una posible solución a estos inconvenientes sería utilizar sistemas de pequeña producción energética. La obtención de energía a partir de las olas, al ser menos invasiva respecto de la energía de las mareas (se necesitan condiciones geográficas e instalaciones para retener agua) y la energía de las corrientes (es necesario la instalación de turbinas bajo flotadores o sobre el lecho marino), se traduce en una alternativa atractiva para abastecer de energía eléctrica a consumos pequeños ubicados en zonas costeras.

Este trabajo, se centra en el estudio del principio de aprovechamiento de energía undimotriz mediante el protoripo de Columna Oscilante de Agua o OWC (*Oscillating Water Column*). El modelo se realiza a escala para poder experimentarlo en el laboratorio de la escuela. Lo que quiere decir, que los valores son representativos para la didáctica, no se extrapolan a la potencia que podría obtenerse de una planta comercial. 

Esto es debido a que no es una conversión directa, el /R/[teorema de $\pi$ de Vaschy-Buckingham](https://es.wikipedia.org/wiki/Teorema_%CF%80_de_Vaschy-Buckingham) es el teorema fundamental del análisis dimensional. Este teorema explica que si se quisiera realizar una simulación a escala, sin cambiar la temperatura ni la gravedad, las dimensiones también debieran ser iguales, luego físicamente no tendría sentido. Otra forma de entenderlo es con el número de Reynolds, parametro adimensional que depende de la geometría del modelo, si se quisiera aumentar este número, sería necesario bajar la temperatura o aumentar la presión.

Adicionalmente, y puesto que hasta el momento no se dispone de una guía que analice las consideraciones a tener en cuenta para simular un caso de principio a fin, se tratará de reunir la información más relevante, de forma que se le facilite al ususario entender los pasos a seguir para simular un flujo, de condiciones determinadas, a través de un diseño modelado por ordenador (CAD, Computer-aided design).

