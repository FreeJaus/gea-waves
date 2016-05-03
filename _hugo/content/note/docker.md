# [DOCKER](https://docs.docker.com/engine/userguide/containers/dockervolumes/)

Docker allows you to run applications, worlds you create, inside containers.

- Running an application inside a container takes a single command:
`docker run / sudo docker run`

## Run a Hello world. (launched a container)
`docker run ubuntu /bin/echo 'Hello world'`
	* se especifica el binario `docker` y el comando a ejecutar, `run`.
	* especificando también la imagen, `ubuntu`. Primero Docker busca la imagen en Docker host y si no la encuentra se la descarga de [Docker HUB](https://hub.docker.com/).
	* dentro del nuevo contenedor se le dice a Docker que comando correr. Cuando el contenedor se lanza Docker crea un nuevo entorno de Ubuntu para ejecutar el comando `/bin/echo`.

## An interactive container.
`docker run -t -i ubuntu /bin/bash`
  * `-t` asigna una terminal dentro del nuevo contenedor

* You can use the `exit` command or enter `Ctrl-D` to finish.
* `docker ps` -> Lists containers.
* `docker logs` -> Shows us the standard output of a container.
* `docker stop` -> Stops running containers.

`$ docker run -d -P taining/webaoo python app.py`
  * `-d` tells Docker to run the container in the background
  * `-P` tells Docker to map any required network ports inside our container to our host.
  * `taining/webaoo` is a pre-built image, that contains a simple Python Flask web application.

* `docker ps -l` -> to return the details of the last container started.
* if you want to see stopped containers too use the `-a` flag.

* `docker start` <container name>
* `docker restart` -> runs a stop and then start on the container
* `docker rm` -> remove a stopped container

## listing images on the host
* when you run a container you refer to a tagged image like so:
`$ docker run -t -i ubuntu:14.04 /bin/bash`

## Getting a new image
`$ docker pull centos`
* `docker search` to find all the images that contain the term `sinatra`.

* You use `#` to indicate a comment

## Name a container:
+ You can name containers `--name`:
  + that do specific functions
  + allows to refer to other containers
`$ docker run -d -P --name web training/webapp python app.py`
* docker inspect <containers --name>

## Launch a container on the default network
Docker provides two network drivers for you, the `bridge` and the `overlay` drivers
`$ docker network ls`
Networks are natural ways to isolate containers from other containers or other networks.
# Create your own bridge network
A `bridge` network is limited to a single host running Docker Engine.
An `overlay` network can include multiple hosts and is a more advanced topic.
`$ docker network create -d bridge my-bridge-network`
## Add containers to a network
* Data volumes, and
* Data volume containers.
## Adding a data volume to a container:
`-v` flag with the `docker create` and `docker run` command. You can use the `-v` multiple times to mount multiple data volumes.
`$ docker run -d -P --name web -v /webapp training/webapp python app.py`
## Mount a host directory as a data volume
to creating a volume using the -v flag you can also mount a directory from your Docker daemons host into a container.
`$ docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py`
This command mounts the host directory, /src/webapp, into the container at /opt/webapp. If the path /opt/webapp already exists inside the containers image, the /src/webapp mount overlays but does not remove the pre-existing content. Once the mount is removed, the content is accessible again. This is consistent with the expected behavior of the mount command.
