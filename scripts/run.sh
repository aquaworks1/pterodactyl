#!/bin/bash

# Script path
spath="$( cd "$(dirname "$0")" ; pwd -P )"

# Create networks ...
#[ -n "$(docker network ls -q -f ""name=pterodactyl_nw"")" ]  && docker network rm pterodactyl_nw
[ -z "$(docker network ls -q -f ""name=pterodactyl_nw"")" ]  && docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 pterodactyl_nw

# Create data folders ...
mkdir -p $spath/../.pterodactyl/mariadb/config          # Database config files
mkdir -p $spath/../.pterodactyl/mariadb/backup          # Database backup folder
mkdir -p $spath/../.pterodactyl/panel                   # Panel data files
mkdir -p $spath/../.pterodactyl/daemon/config           # Daemon config files
mkdir -p $spath/../.pterodactyl/daemon/logs             # Daemon logs files
mkdir -p $spath/../.pterodactyl/daemon/packs            # Daemon packs files

# Build containers ...
docker-compose --file $spath/../docker-compose.yml --project-name pterodactyl build --pull

# Run containers ...
if [[ $(docker-compose --file $spath/../docker-compose.yml ps | grep "Exit" | wc -l) -eq 0 ]]; then
    docker-compose --file $spath/../docker-compose.yml --project-name pterodactyl up -d
else
    docker-compose --file $spath/../docker-compose.yml --project-name pterodactyl start
fi
