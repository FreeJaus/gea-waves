Manage Docker as a non-root user
================================
- [Post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/)

1. Create the docker group.
`$ sudo groupadd docker`
2. Add your user to the docker group.
`$ sudo usermod -aG docker $USER`
3. Log out and log back in so that your group membership is re-evaluated.
4. Verify that you can docker commands without sudo.
`$ docker run hello-world`

Sesion personal de docker-graphical user interface
==================================================
- [portainer.io: the easiest way to manage Docker](https://github.com/1138-4EB/elide)

```
docker run -d --name portainer -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer
```
  * `-d` tells Docker to run the container in the background.
  * `--name portainer` the name of the container.
  * `-p` tells Docker to map any required network ports inside our container to our host.
  * `-v "/var/run/docker.sock:/var/run/docker.sock"` creating a volume using the -v flag you can also mount a directory from your Docker daemons host into a container.

**Error** SELinux -> para autorizar la orden:
`# sudo ausearch -c 'portainer' --raw | audit2allow -M my-portainer`
`# sudo semodule -X 300 -i my-portainer.pp`

- Try again:
`docker stop portainer`
`docker rm portainer`
`docker run -d --name portainer -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer`

- Open firefox: `localhost:9000`
