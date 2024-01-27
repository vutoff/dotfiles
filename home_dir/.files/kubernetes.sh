#!/bin/bash

alias kuberun='k8sctl -n ${NS:-globe} exec -ti $(kubepods | fzf | sed "s/pod\///g")'
alias kubeget='k8ctl -n ${NS:-globe} get'
alias kubessh='kuberun bash'
alias k='kubectl -n ${NS:-globe}'
alias drun='docker run --rm -it --entrypoint /bin/bash'



alias kget='kubectl get'
alias kpods='kubectl get pods -o name'
alias kubedesc='kpods | fzf | xargs kubectl describe'
alias klogs='kpods | fzf | xargs kubectl logs --tail=500 --timestamps -f'

