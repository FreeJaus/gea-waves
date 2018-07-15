1) contexto $\to$ energía recurso de necesidad básica,
   me han llamado la atención las energías renovables,
   propuse analizar la extracción

2) referencias $\to$ zona buena, aprov mareas y olas

3) repaso tecno existentes: VyDV, 
			    costes inversión, 
			    pot. extraída,
			    impact. que provocan,
			    adapt. medio marino
4) comprendió $\to$ prototip. fase comercial estudios: lab y ma
   validar su diseño conceptual y demostración operacional

5) OWC $\to$ simpl. estruct. fija
	     menos nocivo para el ecosistema
	     prox. contamos con 1planta Mutriku
- Llamado así, porque OLAS $\to$ VOL cámara cerrada
  Corriente de AIRE salida $\to$ TURBINA diseñada flujo bi

- Aunq ejem planta REAL, NO datos del modelo.

- Sabemos TODOS los flujos cumplen. Euler18,NS80
Gracias a los PC resolverlas DISCRETIZANDO el DOMINIO aplic cada NODO.

- A mayor ESCALA mayores RECURSOS COMP. capaces de ejecutar con los DISPOnibles.

- Varían según las CONDI del FLUJO. 
pecul MULTI (agua y aire) $\to$ P,U se comparten, representando valores promedio en f(ff del vol en cada celda).
Ec M + EFECTO de la **Tensión Sup** en el calc **interfas**.
Ec transp $\to$ calc el vol de agua por celda (0aire 1agua).

6) Validación Mod de 1 ola por un CANAL.

- OLA $\to$ "damBreak", simula VOL inicial con un RECTANGULO (las celdas ff=1 agua).

- 1ª ola, rebotes, NO gener. OLAS CTE $\to$ disp Energía hasta ESTABILIZAR

- Obj, POTENCIA $\to$ Q x deltaP (P2:atm).

- Complicaciones TURB E $\to$ elem DEPRIMOG. Diaf que provoca caida P, para hallar Q y Pot.

- Comparar los result. por PC con los del LAB para validar el modelo.

7) Resolu probl. CFD
- ci,cc,mod,método de resolu
- el t en resolverse f(potencia PC)
- Visuali, anal dat, render

- Amplia variedad herr

- OF para resolver la DdlF: Ampli USADO indus, POTENTE, MANEJ complic
tanto es así se ofrecen cursos 1week 4000€
Librerías C++, GPL

- Modo básico de proceder, encontrar un modelo ya def. y adecuarlo

8) Se quiso realizar la comparativa con los result del mod en 2D
- Estruct del caso: variables t=0
		    ppiedads físicas
		    Fext
		    Modlo de TURB
		    Esq. discr ecs para el método VOF
		    Procedim solución
		    Control de ejec

9) Diseño del mod blockMesh: v, bloq,contor,celdas.
- hexaédricas de 2mm de tamaño (lim diaf)
- Útil para geom SENCILLAS, se complica para sup CURVAS, se simplifica.

10) OF no opera en 2D, sólo omitimos la sol eje Z.
Se realizaron 2casos $\to$ 80mm canal, 19.6mm chimenea

11) Observando result; Visualmente OK
		       H,Q,Pm bajos y dif f(z)
- Conclusión: need caso en 3D para VS experimento

12) Def modelo: Salome, parecido CAD + varios algorit gener MALLA

- Netgen descomp. TETRAedros para adaptarse OK

13) La solu $\to$ add ficheros para AUTOMATIZAR la SOL: H, Q, Pm

- Estos valores servirán para Validar el mod con el NSY REAL

(video)

14) EXP: maqueta CANAL, fondo unión prototip OWC a unos 2m.
	 Bomba + llave de paso: 45 sumergir la ent cámara
				145 vol ini
	 Compuerta retener a 600mm
	 Pistón de 2vástago carr 160mm + estruct anidar al canal

- Result: H, Pm par los d[13-14-15.5-16].

15) Q se caracterizan los diaf NO normalizados

- Normativa especific: rango rel D
			toma de P
			L min tubo = chim
- Pstatic PIEZOMETRO
PRANDTL dif Ptot y Pst = Pd
v flujo, Q, Coef Q, Re

- Curvas para cada diaf= cte, explic proyect valores Re~ OK puede resultar así

16) 3p/d=12, repit ci agua

- Connect PISTON + TRANS P $\to$ TARJ ADQUi = CONTROL ACC comp + CAPTURA de dat PC

17) Lectura H con la vista= aprox 16cm. APROX a las simu de 16.5cm

18) GRAF $\to$ P para cada prueb/d (azul) + simu (rojo)
- Cuando la ola ENT cámara, VIENDO que COINCIDEN bastant OK.

- Potencia y TAB: errores P,Q,Pot (d16 BAD, fuera del rango normativa + flujo NO encuentra obstrucción.

- A partir de aquí: Desarrollos más complejos con garantías de obt SOL PARECIDA a la REALIDAD

- Ahorro PROCESO de DISEÑO final de EQUi COSTOSOS

Gracias

Agradecimientos
===============
Sé que este trabajo podía haberme llevado menos tiempo pero reconozco que la falta de un compañero la he notado enormemente, por ello:
Quería agradecer a mi tutor el haberse involucrado en mi proyecto más de lo estrictamente necesario.
A mi familia por aguantar mis altibajos, en especial a mi pareja que además me ha ayudado con las dificultades técnicas que supone trabajar con linux y tener las herramientas actualizadas.
Y a los técnicos de la escuela y a otros profesores (Dani, Iker y Cesar) por haberme ayudado a realizar partes del diseño implicadas en el ensayo, gracias a su experiencia, me enseñaron las claves y me allanaron el camino.


