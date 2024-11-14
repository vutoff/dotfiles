export PACKER_PLUGIN_PATH="$HOME/.files/packer_plugins/"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH:$HOME/.pyenv/bin"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/Users/iliyan/bin:$PATH
export PATH=$PATH:$HOME/.bin

export EDITOR=nvim

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(scmpuff init -s)"
eval "$(rbenv init -)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# GitHub
alias weather='curl -s wttr.in/Sofia'

alias vim="nvim"
alias vi="nvim"

alias kctl="kubectl"

alias tui="taskwarrior-tui"

# alias cd="z"

# Fuzzy CD
fd() {
 local dir
 dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
      -print 2> /dev/null | fzf +m) &&
 cd "$dir"
}

# CTags
alias ctags="`brew --prefix`/bin/ctags"

# AWS
function aws-profile() {
  case $1 in
    "")
      export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)
      ;;
    *)
      export AWS_PROFILE=$1
      ;;
  esac
}
