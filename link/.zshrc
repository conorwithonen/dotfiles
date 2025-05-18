# Leaving this until I have a better home for it
UNAME=$(uname)
case $UNAME in
    Linux*)
        export XDG_CONFIG_HOME="$HOME/.config"
        export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
        ;;
    *)
        export XDG_CONFIG_HOME="$HOME"
        autoload -U +X bashcompinit && bashcompinit
        ;;
esac
export DOTFILES=~/dotfiles
export EDITOR=nvim
export VISUAL=$EDITOR

# Source all files in "source"
function src() {
  local file
  if [ "$1" ]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src
