### Working with containers

* **docker ps**
> Show all running containers

* **docker ps -a**
> Show all containers

* **docker inspect <friendly_name|container_id>**
> To get a Docker container's IP address from the host

* **docker inspect <container_id> | grep "IPAddress"**
> To get a Docker container's IP address from the host

* **docker logs <friendly_name|container_id>**
>  Will display messages the container has written to standard error or standard out

* **docker stop <container_id>**
> Stop the container by its container-id

* **docker stop $(docker ps -a -q)**
> Stop all docker containers

* **docker container rm $(docker container ls -a -q)**
> Remove all containers

* **docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)**
> Stop and remove all docker containers

***

### Working with images

* **docker images**
> Show images

* **docker rmi $(docker images -q)**
> DELETE all images with

* **docker rmi -f $(docker images -q)**
> DELETE all images with flag force

* **docker search <image_name>**
> Search the Docker Hub for images
```
docker search redis:latest
```

***


* **docker-compose exec --user=send send zsh**
> Execute manage docker-compose. For example for installing composer

***

* **which docker-compose**
> Path to docker-compose







