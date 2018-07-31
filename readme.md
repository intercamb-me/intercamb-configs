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

### Pulling Intercamb.me images ###

Intercamb.me images are stored on Amazon ECR. To pull the images just run the following command:
````
docker/pull-images.sh
````

### Running Containers ###

First you need to create the Intercamb.me network on Docker:
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

// Please read "Intercamb.me Container" session before
docker/create-container.sh intercamb/intercamb

// Please read "Intercamb.me Website Container" session before
docker/create-container.sh intercamb/intercamb-website
````

## Nginx Container ##

### Certificates ###

#### Installing Let's Encrypt ####
````
certs/install-letsencrypt.sh
````

#### Installing Certificates ####
````
certs/install-certs.sh
````

#### Renewing Certificates (cron task) ####
````
certs/install-certs-tasks.sh
````

## Mongo Container ##

### Opening the Shell ###

````
docker/mongo/connect.sh
````

### Security ###

#### Creating Administrator and User ####

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
  user: "intercamb",
  pwd: "<password>",
  roles: [{
      role : "readWrite",
      db : "intercamb"
  }]
})
````

## Redis Container ##

### Client ###

````
docker/redis/connect.sh
````

## Intercamb.me Container ##

The project configuration file is exported as a Docker volume on $INTERCAMB_HOME/configs/intercamb.config.
This file must be created before running the container.

## Intercamb.me Website Container ##

The project configuration file is exported as a Docker volume on $INTERCAMB_HOME/configs/intercamb-website.config.
This file must be created before running the container.