#!/bin/bash

docker run --rm --network intercamb-network -v "${HOME}/.backups:/data/bkp" mongo:4.1.1 mongorestore --host mongo --gzip --archive=/data/bkp/$1
