#!/usr/bin/env bash

# Make sure folders exist
mkdir -p "/data"

# Adjust file permissions
find /var/www/bootstrap/cache/ -type f -exec chmod 0777 {} \;
find /var/www/storage/*        -type d -exec chmod 0777 {} \;

# chown Directories
find /var/www/bootstrap/cache/ \( \! -user www-data -o \! -group www-data \) -exec chown www-data:www-data {} \;
find /var/www/storage/         \( \! -user www-data -o \! -group www-data \) -exec chown www-data:www-data {} \;

# Put files into volumes on first start
mvlink /var/www/bootstrap/cache    /data/cache
mvlink /var/www/storage            /data/storage

#
find /data \( -name ".gitkeep" -o -name ".githold" -o -name ".gitignore" \) -exec rm -rf {} \;
