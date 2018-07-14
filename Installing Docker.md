Path to Docker for ubuntu https://docs.docker.com/install/linux/docker-ce/ubuntu/
Path to Docker for windows https://docs.docker.com/docker-for-windows/install/

Uninstall old versions

Older versions of Docker were called docker or docker-engine. If these are installed, uninstall them:

$ sudo apt-get remove docker docker-engine docker.io

It’s OK if apt-get reports that none of these packages are installed.

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. 
The Docker CE package is now called docker-ce.

#### Docker without sudo
> https://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo

### Docker-compose install 

* Check the current release and if necessary, update it in the command below:
 > sudo curl -L https://github.com/docker/compose/releases/download/(current_version)/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
 
* Next set the permissions:
> sudo chmod +x /usr/local/bin/docker-compose
 
* Verify that the installation was successful by checking the version:
> docker-compose --version
