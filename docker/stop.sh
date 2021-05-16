#!/usr/bin/env bash

_PROJECT_PATH=$(dirname $0)
. $_PROJECT_PATH/bash-scripts/functions.sh
. $_PROJECT_PATH/bash-scripts/variables.sh

# stop docker containers
_DOCKER_COMPOSE_COMMAND_STOP="docker-compose -f "${_PROJECT_PATH}/${_DOCKER_COMPOSE_FILE}" --project-name drupal stop"

if ! eval ${_DOCKER_COMPOSE_COMMAND_STOP}; then
  echo "ERROR! Could not stop docker containers"
  exit 1
fi

_PROJECT_PATH=$(dirname $0)
. $_PROJECT_PATH/bash-scripts/hosts.sh

remove_hosts_entries