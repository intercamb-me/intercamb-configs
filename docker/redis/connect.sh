#!/bin/bash

docker run --rm -it --network intercamb-network redis:4.0.10-alpine redis-cli -h redis
