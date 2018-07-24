## Docker ##

### Installing docker ###

Just check the instructions below in other install Docker and Docker Compose:

Docker: https://docs.docker.com/engine/installation/linux/docker-ce
Docker Compose: https://docs.docker.com/compose/install/#install-compose

You can also try to install Docker and Docker Compose executing the following scripts:
````
docker/install-docker.sh
docker/install-docker-compose.sh
````

### Pulling Intercambio Images ###

Intercambio images are stored on Amazon ECR. To pull the images just run the following command:
````
docker/pull-images.sh
````

### Running Containers ###

First you need to create the Intercambio network on Docker:
````
docker/create-network.sh
````
And then you can run the containers:
````
// Please read "Nginx Container" session before
docker/create-container.sh nginx

// Please read "Mongo Container" session before
docker/create-container.sh mongo

// Please read "Redis Container" session before
docker/create-container.sh redis

// Please read "Intercambio Container" session before
docker/create-container.sh intercambio/intercambio

// Please read "Intercambio Webcm Container" session before
docker/create-container.sh intercambio/intercambio-webcm

// Please read "Intercambio Website Container" session before
docker/create-container.sh intercambio/intercambio-website
````

## Nginx Container ##

### Certificates ###

#### Installing Let's Encrypt ####
````
certs/install-letsencrypt.sh
````

#### Installing certificates ####
````
certs/install-certs.sh
````

#### Renewing certificates (cron task) ####
````
certs/install-certs-tasks.sh
````

## Mongo Container ##

### Opening the Shell ###

````
docker/mongo/connect.sh
````

### Security ###

#### Creating administrator and user ####

Don't forget to replace the password token by the user password.
````
use admin
db.createUser({
  user: "admin",
  pwd: "<password>",
  roles: [{
      role: "userAdminAnyDatabase",
      db: "admin"
  }]
})
db.createUser({
  user: "intercambio",
  pwd: "<password>",
  roles: [{
      role : "readWrite",
      db : "intercambio"
  }]
})
````

## Redis Container ##

### Client ###

````
docker/redis/connect.sh
````

## Intercambio Container ##

The project configuration file is exported as a Docker volume on $INTERCAMBIO_HOME/configs/intercambio.config.
This file must be created before running the container.

## Intercambio Webcm Container ##

The project configuration file is exported as a Docker volume on $INTERCAMBIO_HOME/configs/intercambio-webcm.config.
This file must be created before running the container.

## Intercambio Website Container ##

The project configuration file is exported as a Docker volume on $INTERCAMBIO_HOME/configs/intercambio-website.config.
This file must be created before running the container.