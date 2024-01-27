alias gds='git branch -D $(git branch | grep -E squash_ | sed "s/ //g")'
alias squash_branch='~/.bin/squash_branch.sh'

gsf() {
  if [ $# -eq 0 ]; then
    git diff-tree --no-commit-id --name-only -r HEAD
  else
    git diff-tree --no-commit-id --name-only -r $1
  fi
}

function gbf () {
  case $1 in
    -r)
      git branch -r | cut -d "/" -f2- | fzf | xargs git checkout
      ;;
    *)
      git branch | fzf | xargs git checkout
      ;;
  esac
}

# SCMPuff Alias
function ge {
  eval "$(scmpuff expand -- "$EDITOR" "$@")"
}

function gdel () {
	eval "$(scmpuff expand -- "rm" "$@")"
}

function ghpr() {
  gh pr list |fzf --layout=reverse --info=inline --ansi --preview="gh pr diff --color=always {1}" | awk '{print $1}' | xargs gh pr checkout
}

function gfixup() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  git log master..${current_branch} --pretty=oneline | fzf --layout=reverse --info=inline --ansi --preview="git show --color=always {1}" | awk '{print $1}' | xargs git commit --fixup
}
