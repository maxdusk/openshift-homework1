#!/bin/bash

#Create Networks
createNetworks() {
echo "...Creating Networks"
docker network create backend-pgsql --driver=bridge
docker network create backend-frontend --driver=bridge
echo "Done..."
}

#Create Volumes
createVolume() {
echo "...Creating Volume"
docker volume create postgresql-data
echo "Done..."
}

#Run Postgres
runPostgres() {
echo "...Start Postgresql Database"
docker run -d -p 5432:5432 \
--name postgres \
--network=backend-pgsql \
--restart always \
-v postgresql-data:/var/lib/postgresql/data \
--env-file ./backend/postgres/env.list postgres:13
echo "Done..."
}

#Run Backend
runBackend() {
echo "...Start Backend"
docker build -f backend/Dockerfile -t backend:rmi .
docker run -d  -p 8080:8080 \
--name backend \
--restart on-failure \
--network=backend-pgsql \
--env-file ./backend/env.list  backend:rmi
# Connect second network to backend container && add alias
docker network connect --alias backend-service backend-frontend backend
echo "Done..."
}

#Run Frontend
runFrontend() {
echo "...Start Frontend"
docker build -f ./frontend/Dockerfile -t frontend-app:rmi .
docker run -d --name frontend -p 3000:80 \
--restart on-failure \
--network=backend-frontend \
--mount type=bind,source="$(pwd)"/conf/todo-list.conf,target=/etc/nginx/conf.d/todo-list.conf frontend-app:rmi
echo "Done..."
}

createNetworks
createVolume
runPostgres
runBackend
runFrontend 

echo "***Application Setup Done***"
