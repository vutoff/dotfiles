# Loaded by ALL zsh sessions (interactive, non-interactive, scripts).
# Keep this fast — only PATH, env vars, and exports. No tool init here.

export LANG=en_US.UTF-8
export EDITOR=nvim

export PACKER_PLUGIN_PATH="$HOME/.files/packer_plugins/"
export NVM_DIR="$HOME/.nvm"

export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND="/usr/local/bin/rg --files"
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

export FORGIT_PAGER='delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}'

# Build PATH once — order matters (first match wins)
typeset -U path  # deduplicate PATH entries automatically
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/bin
  $HOME/.bin
  $HOME/.local/bin
  $HOME/.rd/bin
  ${KREW_ROOT:-$HOME/.krew}/bin
  $HOME/.pyenv/bin
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  /Applications/SnowSQL.app/Contents/MacOS
  $HOME/Projects_Git/go/bin
  $HOME/tmp/sessionmanager-bundle/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)
