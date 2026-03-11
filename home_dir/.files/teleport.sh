#!/bin/bash

tsh-auth-kube-staging() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=kubectl_staging_rw
  tsh --proxy=teleport.prod.rbank-int.com:443 kube login staging-cluster
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
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=kubectl_demo_rw
  tsh --proxy=teleport.prod.rbank-int.com:443 kube login demo-cluster
}

tsh-auth-ssh-production() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_production_root
}

tsh-auth-ssh-staging() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_staging_root
}

tsh-auth-ssh-demo() {
  tsh login --proxy=teleport.prod.rbank-int.com:443 --request-roles=ssh_demo_root
}
