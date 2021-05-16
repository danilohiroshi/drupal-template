#!/usr/bin/env bash

# declare hosts file location
if is_linux || is_mac; then
  _HOSTS_FILE="/etc/hosts"
else
  _HOSTS_FILE="/c/Windows/System32/drivers/etc/hosts"
fi

# user permissions
if is_linux || is_mac; then
  _USER="sudo"
else
  _USER=""
fi

# get the ips
if is_linux; then
  _MYSQL_CONTAINER_IP=$(get_container_ip_address drupal "drupal-mysql")
  _MAIL_CONTAINER_IP=$(get_container_ip_address drupal "drupal-mail")
  _WEB_CONTAINER_IP=$(get_container_ip_address drupal "drupal-web")
else
  # Docker toolbox
  _MYSQL_CONTAINER_IP=$(docker-machine ip 2>/dev/null)
  _MAIL_CONTAINER_IP=$(docker-machine ip 2>/dev/null)
  _WEB_CONTAINER_IP=$(docker-machine ip 2>/dev/null)

  # New Docker version
  _MYSQL_CONTAINER_IP=${_MYSQL_CONTAINER_IP:-127.0.0.1}
  _MAIL_CONTAINER_IP=${_MYSQL_CONTAINER_IP:-127.0.0.1}
  _WEB_CONTAINER_IP=${_WEB_CONTAINER_IP:-127.0.0.1}
fi

function remove_hosts_entries() {
  # Mac expects a different paramter format
  if is_mac; then
    _TFILE=`mktemp /tmp/tfile.XXXXX`
  else
    _TFILE=`mktemp --tmpdir tfile.XXXXX`
  fi

  trap "rm -f ${_TFILE}" 0 1 2 3 15

  # copy hosts to temporary folder
  cp "${_HOSTS_FILE}" "${_TFILE}"

  # if the ip or hostname is already in hosts remove it
  $_USER bash -c "sed --in-place "/"drupal-mysql"/d" "${_TFILE}""
  $_USER bash -c "sed --in-place "/"drupal-mail"/d" "${_TFILE}""

  for url in "${_URLS[@]}"; do
    $_USER bash -c "sed --in-place "/"${url}"/d" "${_TFILE}""
  done

  # put temporary content inside of hosts
  $_USER bash -c "cat "${_TFILE}" | $_USER tee "${_HOSTS_FILE}" 1>/dev/null"

  # exit OK
  return 0
}

function add_hosts_entries() {
  # write the ip address and hostname
  $_USER bash -c "echo "${_MYSQL_CONTAINER_IP}" "drupal-mysql" | $_USER tee -a "${_HOSTS_FILE}""
  $_USER bash -c "echo "${_MAIL_CONTAINER_IP}" "drupal-mail" | $_USER tee -a "${_HOSTS_FILE}""

  for url in "${_URLS[@]}"; do
    $_USER bash -c "echo "${_WEB_CONTAINER_IP}" "${url}" | $_USER tee -a "${_HOSTS_FILE}""
  done
}
