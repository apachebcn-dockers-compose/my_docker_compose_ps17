#!/usr/bin/env bash
MY_VAR=$(grep CONTAINER_NAME= .env | xargs)
MY_VAR=${MY_VAR#*=}_php
echo "Bash to $MY_VAR"
docker inspect $MY_VAR
