#!/bin/sh

docker rm -f backend frontend postgres
docker network rm backend-pgsql backend-frontend
docker volume rm postgresql-data
