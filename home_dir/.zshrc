# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

TERM="xterm-256color"

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=false
COMPLETION_WAITING_DOTS="true"

plugins=(git macos ssh-agent zsh-syntax-highlighting zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh

# --- User configuration ---
DEFAULT_USER=$USER
fpath=(/usr/local/share/zsh-completions $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Terraform completion — only load bashcompinit if terraform is installed
if (( $+commands[terraform] )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$(command -v terraform)" terraform
fi

# Cache kubectl completions instead of regenerating on every startup
_kubectl_comp_cache="${ZSH_CACHE_DIR:-$HOME/.cache}/kubectl_completion.zsh"
if [[ ! -f "$_kubectl_comp_cache" ]] || [[ /opt/homebrew/bin/kubectl -nt "$_kubectl_comp_cache" ]]; then
  /opt/homebrew/bin/kubectl completion zsh > "$_kubectl_comp_cache" 2>/dev/null
fi
[[ -f "$_kubectl_comp_cache" ]] && source "$_kubectl_comp_cache"
unset _kubectl_comp_cache

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Heroku autocomplete
HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup" && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

enable-fzf-tab

# --- Source dotfiles (explicit list, not a glob) ---
source ~/.files/aliases.sh
source ~/.files/aws-vault.sh
source ~/.files/fzf-git.sh
source ~/.files/git_helpers.sh
source ~/.files/kubernetes.sh
source ~/.files/teleport.sh
source ~/.files/terraform.sh
source ~/.files/tmuxinator.zsh
source ~/.files/vault.sh
# colima_completion.sh is a heavyweight completion script — load on demand:
# source ~/.files/colima_completion.sh

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
