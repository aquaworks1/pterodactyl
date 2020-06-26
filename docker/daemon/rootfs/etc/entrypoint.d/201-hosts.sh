#!/usr/bin/env bash

# load environnements variables
. /etc/environment

# search for the panel url
[ -n "$DOCKER_HOST_IP" -a -n "$PANEL_URL" -a -z "$(grep \"$PANEL_URL\" /etc/hosts)" ] && echo "$DOCKER_HOST_IP $PANEL_URL" >> /etc/hosts

return 0
