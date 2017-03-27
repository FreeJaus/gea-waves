gea-waves
=========

# Grupo de Experimentación Autónoma Waves

- Carpeta **"src/tanqueolasarduino"**: 
 	- archivo **`".ino"`** para ejecutarse en el Arduino y el script **`".m"`** es para graficar los resultados en Octave/Matlab.
	- video **"Prueba_tanque de olas.mp4"** para visibilizar el funcionamiento del tanque (sin agua). 
	- documentación para el control del tanque de olas, con la implementación de un arduino:
	 	- Esquema de montaje **`"tanqueolas_esquema.pdf"`** y **`"tanqueolas_bb.pdf"`**.
	 	- Información acerca del control de motores **`"bridge-drivers-for-bldc-motor-applications.pdf"`**.
- Carpeta **"_hugo"**: contenido del trabajo, posibilitando la visualización del mismo mediante el generador de páginas web (hugo). 
	- **"content"**: documentación detallada de cada parte del estudio.
		- **"viabilidad"**
		- **"tfg"**
		- **"readme"**: Informe de los casos (con modificaciones en el código propias) ejecutados en OpenFOAM.
		- **"note"**: Apartados de interés a incluir tanto en la viabilidad como en el tfg.
	- **"public"**: contenido a publicar.
	- **"static"**: código/plantillas en html para mostrar el contenido que se ha ido generando.
	- **"themes"**: tema personalizado. 
	- **`"gea.md"`**: Informe del Control del Tanque de Olas del laboratorio de Ingeniería Nuclear y Mecánica de Fluidos de la EUITI-Bi
- Carpeta **"of-dsgn"**: diseños de los modelos generados para las simulaciones, así como imágenes y animaciones guardadas de las simulaciones mediante OpenFOAM.
- Carpeta **"of-run"**: casos generados a partir de modificaciones en el código de **"damBreak"**, ejemplo descrito en la ["guía de OpenFoam"](http://cfd.direct/openfoam/user-guide/damBreak/#x7-500002.3). 
- Carpeta **dia**: diagrama de proceso del TFG.

