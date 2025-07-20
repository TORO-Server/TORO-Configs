FROM ghcr.io/toro-server/toro-configs-enforcer:latest

WORKDIR /app

COPY /main /app/main
