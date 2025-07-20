#!/bin/bash
cd $(dirname $0)

docker run --rm -it $(docker build -t toro-configs)
