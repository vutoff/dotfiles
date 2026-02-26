#!/bin/bash

FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"

function av() {
  local aws_vault_bin
  aws_vault_bin=$(command -v aws-vault)

  if [ "$1" = "login" ]; then
    if [ -z "$2" ]; then
      LOGIN_PROFILE=$($aws_vault_bin list --profiles | fzf)
    else
      LOGIN_PROFILE=$2
    fi
    LOGIN_URL=$($aws_vault_bin login "${LOGIN_PROFILE}" --stdout)
    ENCODED_URL="${LOGIN_URL//&/%26}"
    URI_HANDLER="ext+container:name=${LOGIN_PROFILE}&url=${ENCODED_URL}"
    "${FIREFOX}" "${FIREFOX_OPTS}" "${URI_HANDLER}" &
  else
    $aws_vault_bin "$1" "${@:2}"
  fi
}
function ave () {
  av exec $@
}
