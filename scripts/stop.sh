#!/bin/bash

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

# Stop running containers ...
docker-compose --file $spath/../docker-compose.yml --project-name pterodactyl stop
