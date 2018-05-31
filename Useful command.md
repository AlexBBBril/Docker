#### docker rmi $(docker images -q) 
> DELETE all images with
#### docker rmi -f $(docker images -q) 
> DELETE all images with flag force
#### docker-compose exec --user=send send zsh 
> Execute manage docker-compose. For example for installing composer
#### which docker-compose 
> Path to docker-compose
#### docker container rm $(docker container ls -a -q) 
> Remove all containers
#### docker inspect your_container_id | grep "IPAddress"
> To get a Docker container's IP address from the host

* **docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)**
> Stop and remove all docker containers
