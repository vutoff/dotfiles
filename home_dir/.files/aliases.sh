# PATH and env vars are in ~/.zshenv

# --- Lazy-loaded tools (deferred until first use) ---

# Pyenv: lazy-load on first call to pyenv or python
pyenv() {
  unfunction pyenv python python3 pip pip3 2>/dev/null
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  pyenv "$@"
}
python()  { unfunction python pyenv python3 pip pip3 2>/dev/null; eval "$(command pyenv init -)"; eval "$(command pyenv virtualenv-init -)"; python "$@" }
python3() { unfunction python pyenv python3 pip pip3 2>/dev/null; eval "$(command pyenv init -)"; eval "$(command pyenv virtualenv-init -)"; python3 "$@" }
pip()     { unfunction python pyenv python3 pip pip3 2>/dev/null; eval "$(command pyenv init -)"; eval "$(command pyenv virtualenv-init -)"; pip "$@" }
pip3()    { unfunction python pyenv python3 pip pip3 2>/dev/null; eval "$(command pyenv init -)"; eval "$(command pyenv virtualenv-init -)"; pip3 "$@" }

# Rbenv: lazy-load on first call to rbenv or ruby
rbenv() {
  unfunction rbenv ruby gem bundle 2>/dev/null
  eval "$(command rbenv init -)"
  rbenv "$@"
}
ruby()   { unfunction rbenv ruby gem bundle 2>/dev/null; eval "$(command rbenv init -)"; ruby "$@" }
gem()    { unfunction rbenv ruby gem bundle 2>/dev/null; eval "$(command rbenv init -)"; gem "$@" }
bundle() { unfunction rbenv ruby gem bundle 2>/dev/null; eval "$(command rbenv init -)"; bundle "$@" }

# Scmpuff: lazy-load on first call
scmpuff() {
  unfunction scmpuff 2>/dev/null
  eval "$(command scmpuff init -s)"
  scmpuff "$@"
}

# NVM: lazy-load on first call to nvm/node/npm/npx
_load_nvm() {
  unfunction nvm node npm npx yarn pnpm 2>/dev/null
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm()  { _load_nvm; nvm "$@" }
node() { _load_nvm; node "$@" }
npm()  { _load_nvm; npm "$@" }
npx()  { _load_nvm; npx "$@" }
yarn() { _load_nvm; yarn "$@" }
pnpm() { _load_nvm; pnpm "$@" }

# --- Eager but fast tools (cached) ---
_zsh_eval_cache() {
  local cache_file="${ZSH_CACHE_DIR:-$HOME/.cache}/zsh_eval_${1//[^a-zA-Z0-9]/_}.zsh"
  if [[ ! -f "$cache_file" ]] || [[ "$(command -v "$1")" -nt "$cache_file" ]]; then
    eval "${@:2}" > "$cache_file" 2>/dev/null
  fi
  source "$cache_file"
}

_zsh_eval_cache zoxide "zoxide init zsh --cmd cd"
_zsh_eval_cache fzf "fzf --zsh"
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
