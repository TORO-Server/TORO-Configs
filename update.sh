#!/bin/bash
cd $(dirname $0)

git fetch origin main
git reset --hard origin/main

docker compose pull
docker compose up
docker compose down
