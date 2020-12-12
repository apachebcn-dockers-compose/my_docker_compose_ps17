#!/usr/bin/env bash
MY_VAR=$(grep CONTAINER_NAME= .env | xargs)
MY_VAR=${MY_VAR#*=}_mysql
echo "Bash to $MY_VAR"
docker exec -u root -ti $MY_VAR bash
