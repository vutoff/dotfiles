#!/bin/bash -x


## vars
op_token_file="/tmp/op_token"
otp_object_id="uv2ecxdvnnctbdhrfkledwfnve"

AWS_VAULT_BIN=$(which aws-vault)
FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
FIREFOX_OPTS="-foreground"
# end of vars

function av() {
  if [ $1 = "list" ]; then
    $AWS_VAULT_BIN list
   return
  fi
  if [ -e ${op_token_file} ]; then
    op_token=$(cat ${op_token_file})

    if [ -z "${op_token}" ]; then
      op_token_time=$(date -v-1d +%s)
    else
      op_token_time=$(/usr/bin/stat -f %c ${op_token_file})
    fi
  else
    op_token_time=$(date -v-1d +%s)
  fi

  current_time=$(date +%s)

  op_token_age=$[${current_time} - ${op_token_time}]

  if [ ${op_token_age} -gt 1700 ]; then
    op_token=$(op signin --account dext_software --raw)
    echo ${op_token} > ${op_token_file}
  else
    op_token=$(cat ${op_token_file})
  fi

  export OP_SESSION_dext_software="${op_token}"

  otp=$(op item get ${otp_object_id} --otp)

  if [ $1 = "login" ]; then

    if [ -z "$2" ]; then
      LOGIN_PROFILE=$($AWS_VAULT_BIN list --profiles | fzf)
    else
      LOGIN_PROFILE=$2
    fi
    FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
    LOGIN_URL=$($AWS_VAULT_BIN login -t ${otp} "${LOGIN_PROFILE}" --stdout)
    ENCODED_URL="${LOGIN_URL//&/%26}"
    URI_HANDLER="ext+container:name=${LOGIN_PROFILE}&url=${ENCODED_URL}"
    "${FIREFOX}" "${FIREFOX_OPTS}" "${URI_HANDLER}" &
  else
    $(which aws-vault) $1 -t ${otp} ${@:2}
  fi
}

function avl () {
  if [ $# -eq 0 ]; then
    LOGIN_PROFILE=$(AWS_VAULT_BIN list --profiles | fzf)
  else
    LOGIN_PROFILE=$1
  fi
  LOGIN_URL=$(av login "${LOGIN_PROFILE}" -d 8h --stdout)
  [[ $? != 0 ]] && echo "${LOGIN_URL}" && return
  ENCODED_URL="${LOGIN_URL//&/%26}"
  URI_HANDLER="ext+container:name=${LOGIN_PROFILE}&url=${ENCODED_URL}"
  "${FIREFOX}" "${FIREFOX_OPTS}" "${URI_HANDLER}" &
}

function ave () {
  av exec $@
}
