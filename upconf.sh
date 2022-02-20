#!/usr/bin/env bash

urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}
urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ >/dev/null && pwd )"

SUBSCRIBE_URL="https://example.com/subscribe?target=clash"
if [ ! -f ${APP_PATH}/data/clash/config/config.yaml ]; then
  if [ -f ${APP_PATH}/data/clash/config/config.template.yml ]; then
      cp -af ${APP_PATH}/data/clash/config/config.template.yml ${APP_PATH}/data/clash/config/config.yaml
  fi
fi
if [ ! -f ${APP_PATH}/.env ]; then
  if [ -f ${APP_PATH}/.env.example ]; then
    cp -af ${APP_PATH}/.env.example ${APP_PATH}/.env
  fi
fi

if [ ! -z "$1" ]; then
  SUBSCRIBE_URL="$1"
else
  source ${APP_PATH}/.env
fi
SUBSCRIBE_URL_ENCODED=$(urlencode "${SUBSCRIBE_URL}")
echo ${SUBSCRIBE_URL}
sed -i -e "s|\&url=\(.*\)|\&url=${SUBSCRIBE_URL_ENCODED}\"|" ${APP_PATH}/data/clash/config/config.yaml
sed -i -e "s|SUBSCRIBE_URL=\"\(.*\)\"|SUBSCRIBE_URL=\"${SUBSCRIBE_URL}\"|" ${APP_PATH}/.env

echo "done."
