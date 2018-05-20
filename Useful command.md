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
