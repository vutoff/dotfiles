# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=false
COMPLETION_WAITING_DOTS="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(aws git macos ssh-agent zsh-syntax-highlighting iterm2 terraform kubectl git-auto-fetch git-extras gh brew ansible zsh-autosuggestions genpass fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='vim'

DEFAULT_USER=vutoff
fpath=(/usr/local/share/zsh-completions $fpath)

# Terraform completion for the binary's own completer
if (( $+commands[terraform] )); then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C "$(command -v terraform)" terraform
fi

export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$HOME/tmp/sessionmanager-bundle/bin:$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tabtab source for packages
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
enable-fzf-tab

# Aliases & tool init
for file in ~/.files/*.*sh; do
    source "$file"
done

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# GITSTATUS_LOG_LEVEL=DEBUG
