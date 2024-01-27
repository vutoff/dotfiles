# Terraform aliases
function tfinit {
  if [[ -z "${AWS_VAULT_PROFILE}" ]]
  then
    export AWS_VAULT_PROFILE=$(cat ~/.aws/config |grep -e ^\\\[ |cut -d " " -f 2 |tr -d "]" | fzf)
  fi

  av exec ${AWS_VAULT_PROFILE} -- terraform init $@
}

function tfplan {
  if [[ -z "${AWS_VAULT_PROFILE}" ]]
  then
    export AWS_VAULT_PROFILE=$(cat ~/.aws/config |grep -e ^\\\[ |cut -d " " -f 2 |tr -d "]" | fzf)
  fi

  av exec ${AWS_VAULT_PROFILE} -- terraform plan -var-file=tfvars/live.tfvars -out=/tmp/plan.out $@
}

function tfapply {
  if [[ -z "${AWS_VAULT_PROFILE}" ]]
  then
    export AWS_VAULT_PROFILE=$(cat ~/.aws/config |grep -e ^\\\[ |cut -d " " -f 2 |tr -d "]" | fzf)
  fi

  av exec ${AWS_VAULT_PROFILE} -- terraform apply "/tmp/plan.out"
}


