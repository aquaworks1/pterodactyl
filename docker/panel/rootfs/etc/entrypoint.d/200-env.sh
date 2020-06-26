#!/usr/bin/env bash

[ -n "$(env_get "PANEL_VERSION")" ]         && env_set "PANEL_VERSION" "$(env_get "PANEL_VERSION")" || true
[ -n "$(env_get "DOCKER_HOST_IP")" ]        && env_set "DOCKER_HOST_IP" "$(env_get "DOCKER_HOST_IP")" || true
[ -n "$(env_get "DAEMON_URL")" ]            && env_set "DAEMON_URL" "$(env_get "DAEMON_URL")" || true

# Define application settings
env_set "APP_DEBUG"             "$(env_get "APP_DEBUG" "false")"
env_set "APP_ENV"               "$(env_get "APP_ENV" "production")"
env_set "APP_ENVIRONMENT_ONLY"  "$(env_get "APP_ENVIRONMENT_ONLY" "false")"
env_set "APP_KEY"               "$(env_get "APP_KEY" "SomeRandomString3232RandomString")"
env_set "APP_LOG"               "$(env_get "APP_LOG" "daily")"
env_set "APP_NAME"              "$(env_get "APP_NAME" "Pterodactyl")"
env_set "APP_SERVICE_AUTHOR"    "$(env_get "APP_SERVICE_AUTHOR" "unknown@unknown.com")"
env_set "APP_THEME"             "$(env_get "APP_THEME" "pterodactyl")"
env_set "APP_URL"               "$(env_get "APP_URL" "http://pterodactyl.example.com/")"
env_set "APP_CLEAR_TASKLOG"     "$(env_get "APP_CLEAR_TASKLOG" "720")"
env_set "APP_DELETE_MINUTES"    "$(env_get "APP_DELETE_MINUTES" "10")"
env_set "APP_TIMEZONE"          "$(env_get "APP_TIMEZONE" "UTC")"
env_set "APP_LOCALE"            "$(env_get "APP_LOCALE" "en")"

# Define application settings
if [[ -n "$(env_get "DB_HOST")" ]];     then env_set "DB_HOST" "$(env_get "DB_HOST")"; fi
if [[ -n "$(env_get "DB_PORT")" ]];     then env_set "DB_PORT" "$(env_get "DB_PORT")"; fi
if [[ -n "$(env_get "DB_DATABASE")" ]]; then env_set "DB_DATABASE" "$(env_get "DB_DATABASE")"; fi
if [[ -n "$(env_get "DB_USERNAME")" ]]; then env_set "DB_USERNAME" "$(env_get "DB_USERNAME")"; fi
if [[ -n "$(env_get "DB_PASSWORD")" ]]; then env_set "DB_PASSWORD" "$(env_get "DB_PASSWORD")"; fi

# Define application settings
if [[ -n "$(env_get "REDIS_HOST")" ]];  then env_set "REDIS_HOST" "$(env_get "REDIS_HOST")"; fi
if [[ -n "$(env_get "REDIS_PORT")" ]];  then env_set "REDIS_PORT" "$(env_get "REDIS_PORT")"; fi

# Define application settings
env_set "MAIL_DRIVER"           "$(env_get "MAIL_DRIVER" "smtp")"
env_set "MAIL_HOST"             "$(env_get "MAIL_HOST" "mailtrap.io")"
env_set "MAIL_PORT"             "$(env_get "MAIL_PORT" "2525")"
env_set "MAIL_USERNAME"         "$(env_get "MAIL_USERNAME" "Pterodactyl Panel")"
env_set "MAIL_PASSWORD"         "$(env_get "MAIL_PASSWORD")"
env_set "MAIL_ENCRYPTION"       "$(env_get "MAIL_ENCRYPTION")"
env_set "MAIL_FROM"             "$(env_get "MAIL_FROM" "pterodactyl@example.com")"
env_set "MAIL_FROM_NAME"        "$(env_get "MAIL_FROM_NAME" "Pterodactyl")"

# Define application settings
env_set "API_PREFIX" "$(env_get "API_PREFIX" "api")"
env_set "API_VERSION" "$(env_get "API_VERSION" "v1")"
env_set "API_DEBUG" "$(env_get "API_DEBUG" "false")"

# Define default cache driver variables
env_set "CACHE_DRIVER" "$(env_get "CACHE_DRIVER" "file")"           # Supported: "apc", "array", "database", "file", "memcached", "redis"

# Define default session driver variables
env_set "SESSION_DRIVER" "$(env_get "SESSION_DRIVER" "database")"   # Supported: "file", "cookie", "database", "apc", "memcached", "redis", "array"

# Define default queu driver variables
env_set "QUEUE_DRIVER" "$(env_get "QUEUE_DRIVER" "database")"       # Supported: "sync", "database", "beanstalkd", "sqs", "redis", "null"
env_set "QUEUE_HIGH" "$(env_get "QUEUE_HIGH" "high")"
env_set "QUEUE_STANDARD" "$(env_get "QUEUE_STANDARD" "standard")"
env_set "QUEUE_LOW" "$(env_get "QUEUE_LOW" "low")"

# Define default SQS variables
env_set "SQS_KEY" "$(env_get "SQS_KEY" "aws-public")"
env_set "SQS_SECRET" "$(env_get "SQS_SECRET" "secret")"
env_set "SQS_QUEUE_PREFIX" "$(env_get "SQS_QUEUE_PREFIX" "aws-queue-prefix")"

# You can also define default admin variables
if [[ -n "$(env_get "ADMIN_USERNAME")" ]];      then env_set "ADMIN_USERNAME" "$(env_get "ADMIN_USERNAME")"; fi
if [[ -n "$(env_get "ADMIN_FIRST_NAME")" ]];    then env_set "ADMIN_FIRST_NAME" "$(env_get "ADMIN_FIRST_NAME")"; fi
if [[ -n "$(env_get "ADMIN_LAST_NAME")" ]];     then env_set "ADMIN_LAST_NAME" "$(env_get "ADMIN_LAST_NAME")"; fi
if [[ -n "$(env_get "ADMIN_MAIL")" ]];          then env_set "ADMIN_MAIL" "$(env_get "ADMIN_MAIL")"; fi
if [[ -n "$(env_get "ADMIN_PASSWORD")" ]];      then env_set "ADMIN_PASSWORD" "$(env_get "ADMIN_PASSWORD")"; fi
                                                     env_set "ADMIN_STAT" "$(env_get "ADMIN_STAT" "1")"
