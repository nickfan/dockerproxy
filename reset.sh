#!/usr/bin/env bash

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ >/dev/null && pwd )"

if [ -f ${APP_PATH}/data/clash/config/config.yml ]; then
  rm -rf ${APP_PATH}/data/clash/config/config.yml
fi

if [ -f ${APP_PATH}/data/clash/config/config.yaml ]; then
  rm -rf ${APP_PATH}/data/clash/config/config.yaml
fi

if [ -f ${APP_PATH}/.env ]; then
  rm -rf ${APP_PATH}/.env
fi
