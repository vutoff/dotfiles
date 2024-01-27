#!/bin/bash

alias tshstg="tsh --proxy=teleport.staging.rbank-int.com:443"
alias tshprd="tsh --proxy=teleport.prod.rbank-int.com:443"


tsh-auth-kube-staging() {
  tsh login --proxy=teleport.staging.rbank-int.com:443 --request-roles=kubectl_staging_rw
  tsh --proxy=teleport.staging.rbank-int.com:443 kube login staging-cluster
}

tsh-auth-kube-production() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=kubectl_production_rw
  tsh --proxy=teleport.prod.rbank-int.com:443 kube login production-cluster
}

tsh-auth-kube-infrastructure() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=kubectl_infrastructure_rw
  tsh --proxy=teleport.prod.rbank-int.com:443 kube login infrastructure-cluster
}

tsh-auth-kube-demo() {
  tsh login --proxy=teleport.staging.rbank-int.com:443 --request-roles=kubectl_demo_rw
  tsh --proxy=teleport.staging.rbank-int.com:443 kube login demo-cluster
}

tsh-auth-base-ssh-production() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_production_base_root
}

tsh-auth-base-ssh-staging() {
  tsh login --proxy=teleport.staging.rbank-int.com:443 --request-roles=ssh_staging_base_root
}

tsh-auth-k8s-ssh-staging() {
  tsh login --proxy=teleport.staging.rbank-int.com:443 --request-roles=ssh_staging_kubernetes_staging_root
}

tsh-auth-k8s-ssh-demo() {
  tsh login --proxy=teleport.staging.rbank-int.com:443 --request-roles=ssh_staging_kubernetes_demo_root
}

tsh-auth-k8s-ssh-infrastructure() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_production_kubernetes_infrastructure_root
}

tsh-auth-k8s-ssh-production() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_production_kubernetes_production_root
}
