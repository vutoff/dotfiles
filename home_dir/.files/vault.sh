#!/bin/bash
unset VAULT_ADDR
unset VAULT_TOKEN

export VAULT_ADDR=https://vault.dext.tools

_TOKEN_FILE="$HOME/.vault-token"

# Auth to vault
function vault_auth {
  gh_token=$(security find-generic-password -a vutoff -s github_token -w)
  case $1 in
    show)
      echo "Your token is: ${gh_token}"
      echo $gh_token | pbcopy
      ;;
    *)
      vault login -method=github token=${gh_token}
      if [ -f $_TOKEN_FILE ]; then
        token=$(cat $_TOKEN_FILE)
        if [ ! -z $token ]; then
          export VAULT_TOKEN=$token
        fi
        # rm $_TOKEN_FILE
      fi
      ;;
  esac
}
