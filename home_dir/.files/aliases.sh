export PACKER_PLUGIN_PATH="$HOME/.files/packer_plugins/"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH:$HOME/.pyenv/bin"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.cargo/bin

export EDITOR=nvim

alias elevate='PrivilegesCLI --add "Requested from CLI"'

# --no-rehash skips shim regeneration at startup (the slow part). Shims are
# still on PATH and versions resolve as usual; run `pyenv rehash` / `rbenv
# rehash` after installing a new tool if its shim is missing.
eval "$(pyenv init - --no-rehash zsh)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init - --no-rehash zsh)"
eval "$(scmpuff init -s)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# nvm: --no-use skips the automatic version resolution on startup (~700ms).
# The newest installed node goes on PATH directly; `nvm use X` still works.
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    \. "/opt/homebrew/opt/nvm/nvm.sh" --no-use
    () {
        local -a _nodes
        _nodes=("$NVM_DIR"/versions/node/*/bin(Nn/))
        (( $#_nodes )) && path=("${_nodes[-1]}" $path)
    }
fi
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
alias ctags="/opt/homebrew/bin/ctags"

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
