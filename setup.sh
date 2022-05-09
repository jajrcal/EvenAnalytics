#!/bin/bash

# cleanup any previous runs
docker compose down --volumes
# start up the containers
docker compose up