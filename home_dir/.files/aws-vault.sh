#!/bin/bash -x

AWS_VAULT_BIN=$(which aws-vault)
FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"

function av() {
  if [ $1 = "login" ]; then

    if [ -z "$2" ]; then
      LOGIN_PROFILE=$($AWS_VAULT_BIN list --profiles | fzf)
    else
      LOGIN_PROFILE=$2
    fi
    FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
    LOGIN_URL=$($AWS_VAULT_BIN login "${LOGIN_PROFILE}" --stdout)
    ENCODED_URL="${LOGIN_URL//&/%26}"
    URI_HANDLER="ext+container:name=${LOGIN_PROFILE}&url=${ENCODED_URL}"
    "${FIREFOX}" "${FIREFOX_OPTS}" "${URI_HANDLER}" &
  else
    $(which aws-vault) $1  ${@:2}
  fi
}
function ave () {
  av exec $@
}
