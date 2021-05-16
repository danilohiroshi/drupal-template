#!/usr/bin/env bash
_PROJECT_PATH=$(dirname $0)
. $_PROJECT_PATH/bash-scripts/functions.sh
. $_PROJECT_PATH/bash-scripts/variables.sh

# build docker containers
_DOCKER_COMPOSE_COMMAND_BUILD="docker-compose -f "${_PROJECT_PATH}/${_DOCKER_COMPOSE_FILE}" --project-name drupal build --pull --force-rm"

if ! eval ${_DOCKER_COMPOSE_COMMAND_BUILD}; then
  echo "ERROR! Could not build docker containers"
  exit 1
fi


# spin-up docker containers
_DOCKER_COMPOSE_COMMAND_UP="docker-compose -f "${_PROJECT_PATH}/${_DOCKER_COMPOSE_FILE}" --project-name drupal up -d"

if ! eval ${_DOCKER_COMPOSE_COMMAND_UP}; then
  echo "ERROR! Could not start docker containers"
  exit 1
fi

. $_PROJECT_PATH/bash-scripts/hosts.sh
remove_hosts_entries
add_hosts_entries