#!/usr/bin/env bash


DOCKER_HOST_IP=$(env_get "DOCKER_HOST_IP")
DAEMON_URL=$(env_get "DAEMON_URL")

# search for the daemon url
[ -n "$DOCKER_HOST_IP" -a -n "$DAEMON_URL" -a -z "$(grep \"$DAEMON_URL\" /etc/hosts)" ] && echo "$DOCKER_HOST_IP $DAEMON_URL" >> /etc/hosts

return 0
