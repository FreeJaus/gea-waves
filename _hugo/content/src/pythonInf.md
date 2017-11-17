[Contrib/PyFoam](https://openfoamwiki.net/index.php/Contrib/PyFoam)
En esta sección se detallan varias utilidades de unas librerías de Python, para el control de la ejecución *OpenFOAM-runs* y manipulación de datos *OpenFOAM-data*. Estas facilitan el procesamiento de los casos si al usuario no le asusta trabajar por línea de comandos.

# 1. Breve descripción
Estas librerías de Python se pueden usar para:
- analizar los archivos de registro producidos por los resolvedores de OpenFoam;
- ejecuta el resolvedor y las utilidades, analizando, simultáneamente, las salidas;
- manipula los parámetros y condiciones iniciales de los archivos de forma no destructiva;
- grafica los residuos del resolvedor.

## 1.1 Motivación
Las librerías fueron desarrolladas para controlar las simulaciones de OpenFoam con script decentes para realizar variaciones de parámetros o analizar resultados.

El desarrollador asume el esfuerzo continuo, añadiendo características en una base *As-Needed* y abierto a sugerencias. (GPL, cooperative)

## 1.2 Compatibilidad
Estas librerias tratan de ser conservadoras, en la medida de lo posible, tratando de usar sólo librerías estándares que están en la distribución de Python. Actualmente, se requiere al menos la versión 2.5 de [Python](https://www.python.org/), pero se ha probado para las versiones anteriores.

Para poder graficar se necesita la librería [Numpy](http://www.numpy.org/), se recomienda descargarse la última versión (PyFoam no requiere una versión específica).

Debería ejecutarse en cualquier sistema con OpenFoam  y Python, actualmente se ha probado en Linux y MacOS X.

## 1.3 Otros materiales
Presentación que ofrece un repaso de lo que se puede hacer con PyFoam: ["Happy Foaming with Python"](https://openfoamwiki.net/images/d/de/HappyFoamingWithPyFoam.pdf).

Otra presentación de interés: ["Automatization with pyFoam"](http://web.student.chalmers.se/groups/ofw5/Advanced_Training/pyFoamAdvanced.pdf)

# 2. Instalación
- For plotting and other data handling operations: numpy.

`sudo dnf install numpy`

- Installing with pip: `sudo pip install PyFoam`
- `pip install --user PyFoam`
- `pip install --upgrade PyFoam`
- Testing the installation:

```
python
import PyFoam
import PyFoam.FoamInformation
print PyFoam.FoamInformation.foamTutorials()
```

Lo que produce `/home/nameroot/OpenFOAM/OpenFOAM-4.1/tutorials`.

The shell can be left with Control-D.

# 3. Utilidades instaladas
- `pyFoamPlotWatcher.py log.interFoam`: Una de las más recomendadas, utilizada para mostrar los residuos durante una simulación o tras haberla ejecutado, sin que interfiera en la misma.

- `pyFoamRunner.py interFoam`: contiene información sobre **Residuals and other information of the linear solvers; execution time; continuity information; bounding of variables**.
