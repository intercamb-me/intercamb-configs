#!/bin/bash

docker run --rm -it --network intercambio-network redis:4.0.5-alpine redis-cli -h redis
