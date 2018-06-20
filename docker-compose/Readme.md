### Description of docker-compose for training and memorization.

#### Docker-compose example:
```
version: '2'
services:
  web:
    build:
      context: ./web
      dockerfile: Dockerfile
    volumes:
      - "./web/src:/web/src"
    ports:
      - "8080:8080"
  mongo:
    command: mongod
    image: mongo:3.2.0
    ports:
      - "27100:27017" # map port to none standard port, to avoid conflicts with locally installed mongodb. 
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
#### Docker-compose sections description
* context: ./web 
> The path to the docker file in our repository, from the current directory.

* dockerfile: Dockerfile
> Name of docker file
