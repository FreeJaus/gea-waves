---
title: "Tareas realizadas y a realizar"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# Estado del Arte

- Situación energética/ marco normativo y fomento de las Energías Renovables
- Aprovechamiento de la energía
  - Olas
     - Energía potencial
	 - Energía cinética
	 - Energía por variaciones de presión 
  - Mareas 
  - Corrientes 
  - Incrementos de temperatura 
  - Gradientes salinos
- Energía undimotriz f(características del emplazamiento, viabilidad, impacto ambiental)
- Variedad de tipos y formas de clasificarlos
- OWC f(modelo físico, durabilidad, trasporte de energía)
   
# Pasos para ejecutar la simulación
0. Análisis de las herramientas disponibles
1. Definir el problema (turbulento, incompresible)
2. Generación de la malla (blockMesh, snappyHexMesh | netgen, salome, blender)
3. Boundary + initial conditions (definir las propiedades de cada capa. Ej totalPressure, pressureInletOutlet, velocityInletOutlet)
4. Initial fields (fracción de fase entre 0-1) and Physical Properties (Re)
5. Control time (time step, Co, ...)
6. Discretization shemes(fvSchemes-> VOF; fvSolution-> PISO, MULES)
7. Solver (icoFoam, pisoFoam, interFoam, solidDisplacementFoam)

# Ejemplos de aplicación

- damBreak (multifase, interFoam, laminar)
- damBreakFine (improved mesh resolution, run in parallel)
- damBreakMod (change geometry introducing chimney) 
- damBreak3d (añadir profundidad al tanque y definir el agua en una esquina para apreciar como se propagaría)
- damBreak3dSnappy (subdivide uniformemente en los 3ejes, plano de refinado)
- damBreakActuador (dynamicMesh, pala que induzca el movimiento al fluido)

# Análisis de las ecuaciones que rigen la dinámica de los fluidos
- Ecuaciones de Gobierno de la mecánica de fluidos:
  - Conservación de la masa.
  - Conservación de la cantidad de movimiento.
  - Conservación del momento cinético.
  - Conservación de la energía.
- Sistema de acoplado de ecuaciones del que no es posible obtener una única solución analítica.
- Análisis diferencial: sustituyendo las derivadas por relaciones algebraicas entre un número finito de puntos del fluido para resolverlas por ordenador.
- No obstante, con la aparición de los métodos de acoplamiento (SIMPLE, PISO, PIMPLE) que utilizan la ecuación del momento y la de tranporte para hallar las variables de presión y velocidad.

# Maquetas

- Caja
- Sensores 
   - sensor de distancia ultrasónico
   - sensor resistivo lineal
- Tipo de motor
- Tipo de movimiento/accionamiento
- Etapa de potencia
- Placa de control
