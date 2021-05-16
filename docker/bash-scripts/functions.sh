#!/usr/bin/env bash

## functions

function get_container_ip_address()
{

  # variables
  local _PROJECT_NAME="${1:-}"
  local _CONTAINER_NAME="${2:-}"

  # get the ip command
  local _CONTAINER_IP=$(docker inspect --format "{{ .NetworkSettings.Networks."${_PROJECT_NAME}"_default.IPAddress }}" "${_CONTAINER_NAME}")

  # return the ip
  echo "${_CONTAINER_IP}"

} # end of get_container_ip_address

function insert_comma_after_each_string()
{

  # variables
  local _ARRAY_OF_STRINGS="${@}"

  # transform the string
  local _RETURN=$(echo "${_ARRAY_OF_STRINGS[@]}" | tr ' ' ',')

  # return
  echo "${_RETURN}"

  # exit OK
  return 0
}

function is_linux()
{
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    return 0
  else
    return 1
  fi
}

function is_mac()
{
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  else
    return 1
  fi
}

function is_windows()
{
  if [[ "$OSTYPE" == "msys" ]]; then
    return 0
  else
    return 1
  fi
}