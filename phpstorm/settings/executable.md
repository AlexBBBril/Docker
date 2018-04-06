### Work with PhpStorm

Go to : / Preferences / Build,Execution,Deployment / Docker / Tools
Make sure that the "Docker Compose executable:" field contains the complete path where docker compose is installed into.
How to determine the complete path:
run "which docker-compose"
note the full path for docker-compose; i.e., "/usr/local/bin/docker-compose"
Click "Apply", Then click "OK"

docker-compose will now properly be executed when you "Run" the "docker deployment" configuration.
