# Leaving this until I have a better home for it
autoload -U +X bashcompinit && bashcompinit

# Where the magic happens whenever we can clear up the above stuff.
export DOTFILES=~/dotfiles

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
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
