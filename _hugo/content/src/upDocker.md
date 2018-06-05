# docker-compose.yml
Archivo que permite lanzar portainer en el navegador para interactuar con docker gráficamente, para ello desde la carpeta que contiene dicho archivo: "/c/User/Leire/Documents/portainerC"
- Lanzar por terminal la orden: `docker-compose up -d` (-d para que no salga por pantalla el proceso y seguir utilizando la terminal)
- Para terminar el proceso sustituir `up` por `down`
- Entrar desde el navegador a `localhost:9000`

# OpenFOAM
- Descargar la imagen desde Docker Hub:
`docker pull openfoam/openfoam5-paraview54`
- Lanzar el contenedor, compartiendo la carpeta de los casos del usuario:
` winpty docker run -itv --name micont //c/Users/Leire/Documents/gea-waves/gea-waves-develop://opt/geawaves -e DISPLAY=10.0.75.1:0 openfoam/openfoam5-paraview54 bash` 

# Clone repositories
- Para ver las ramas del repositorio:
$ git branch -a
- Cambiar de rama:
$ git checkout <nameOfBranch>
- Si esto no funciona:
[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
$ git checkout -b hotfix-1.2.1 master
`Switched to a new branch "hotfix-1.2.1"`
- Clonar una branch:
$ git clone -b develop http:///github.com/FreeJaus/gea-waves.git ../gea-waves/


- [Renaming a file using the comand line](https://help.github.com/articles/renaming-a-file-using-the-command-line/)

$ git mv old_filename new_filename
$ git status
$ git commit -m "Rename file"
$ git push <origin your-branch>

$ git checkout wkpcases
$ git reset --hard develop
$ gitk --all
$ git reset --hard 2beb7c085...(direccionado al commit que se desee)

$ git checkout master
$ git merge develop 
$ git push

git rebase develop

git branch -u

-u (or --set-upstream) origin wkpcases

# Salome
- [1138-4EB](https://github.com/1138-4EB/elide/wiki/Desktop), para ejecutar herramientas que requieran interfaz gráfica. La solución reside en compartir un servidor X ejecutado desde el anfritión.
- Descargar Xming, una vez instalado, ejecutar desde: c>ProgramFiles(x86)>Xming>XLaunch 
- Con las siguiente configuración:
	- multiwindow
	- clipboard
	- no access
- Descargar imagen: 
`docker pull trophine/salome-8.2.0:nvidia`


$ winpty docker run --rm --name micont -it -v //c/Users/Leire/Documents/gea-waves/gea-waves-develop://opt/geawaves   -e DISPLAY=10.0.75.1:0 openfoam/openfoam5-paraview5 sh

`Ejecutar contenedor, que al salir se borrará, con el nombre micont, con una terminal con la que poder interactuar, pudiendo compartir los archivos de la carpeta gea-waves-develop (host) con geawaves (contenedor), imagen, bash.`

$ winpty docker run --rm -it -e DISPLAY=10.0.75.1:0 python:alpine
$ winpty docker run --rm -it -e DISPLAY=10.0.75.1:0 trophime/salome-8.2.0:nvidia

- Para conocer la información de una imagen que esté en ejecución:
$ docker volume inspect IDimage
- Para compartir la información de un volumen desde un contenedor, pudiendo modificar su contenido sin que afecte al volumen original.
$ winpty docker run --rm -it -v /$(pwd):/prueba -v mivolumen://casos alpine sh
`ejecutar docker compartiendo la carpeta en la que esta, con prueba dentro del contenedor y enlazar el volumen mivolumen con la carpeta casos, dentro del mismo contenedor.`
$ winpty docker run --rm --name micont -it -v mivolumen://kiwi alpine sh
`Cualquier archivo modificado dentro de casos permanecerá si conserva el nombre del contenedor, aunque la carpeta que se cree se llame de diferente forma el contenido corresponderá a mivolumen.`

# cfMesh
imagen: fsys/openfoam4-paraview50-cfmesh