#!/usr/bin/env bash

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ >/dev/null && pwd )"

APP_COMPOSE_FILE_NAME="docker-compose.yml"
APP_COMPOSE_FILE_PATH="${APP_PATH}/${APP_COMPOSE_FILE_NAME}"

cd ${APP_PATH} && docker-compose -f ${APP_COMPOSE_FILE_PATH} down
