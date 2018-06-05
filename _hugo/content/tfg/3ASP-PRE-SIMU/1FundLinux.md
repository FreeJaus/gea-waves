A la hora de trabajar con OpenFOAM, es necesario quitarse los miedos a trabajar por línea de comandos, aunque para ello existen tutoriales y una amplia comunidad que ha ido resolviendo diferentes dudas y conflictos con el código.

así mismo en este apartado se listan las instrucciones más útiles que se han llevado a cabo en este trabajo

- Control de procesos en ejecución:
  - `Ctrl+d`



- `meld ./Case1 ./Case2`: para revisar las diferencias de dos casos

crear un fichero: cat>fichero.txt o touch fichero.txt

Generar script: `touch mi_script.sh`

Editar

Hacer que sea ejecutable: `chmod +x mi_script.sh`

Ejecutar por terminal: `./mi_script.sh`

- Ver procesos en ejecución: top

ls *.tex 

ls -lt: listar los ficheros contenidos indicando hora de modificación

cat >> log.txt añade a la salida sin machacar su contenido

Se puede usar el programa meld para comparar las diferencias respecto del caso base `meld damBreak damBreakMod`.

`simpleFOam | tee -a log.txt`: cuando se quiere realizar algun cambio y volver a ejecutar el caso, se puede guardar a continuación del otro caso si se indica que ya existe ese fichero.