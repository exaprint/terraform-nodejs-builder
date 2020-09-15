# Terraform Node.js Builder

Image to build a terraform and node.js project.

# Build Docker

From root folder :  

Build image :   
```shell script
docker build -t terraform-nodejs-local  .
```

List images :
```shell script
sudo docker images ls -a
```

Delete image :
```shell script
sudo docker image -f rm {{imageId}}`
```

Run image : (add value you want to execute inside as last argument)
```shell script
sudo docker run -p 4000:80 terraform-nodejs-local -e 'echo "hello"'
```

Go into docker :
```shell script
docker exec -it terraform-nodejs-local /bin/bash
```

# Info

[Docker Hub Exaprint](https://hub.docker.com/orgs/exaprint)
conected to github repo. 
All push to master or push tag will trigger a new build to the ***[Docker Hub repository](https://hub.docker.com/repository/docker/exaprint/terraform-nodejs-builder)***