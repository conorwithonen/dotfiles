#!/bin/bash
OS_TYPE=$(uname)
CONFIG_DIR="$HOME/.config/test"

# for the .files
shopt -s dotglob

# APPLICATIONS
# Install Homebrew and Homebrew nonsense
function check_homebrew_install() {
    if ! command -v brew >/dev/null 2>&1
    then
        echo ">>>Homebrew could not be found. Installing Now"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

function install_from_brewfile () {
    brew upgrade
    brew bundle install ~/dotfiles/Brewfile
    brew cleanup
}

# Non-MacOS

function some_linux_install_script() {
   echo ">>>Installing Linux Applications"
}

# Copy over every thing to source dir
# Link all the nonsens

# Do the things
function strap_up() {
    # Files to copy
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "README.md" \
        --exclude "bootstrap.sh" \
        -avh --no-perms ./copy ~;

    # Home Files
    for file in ~/dotfiles/link/*; do
      echo "Link: $file"
      ln -s "$file"  "$HOME";
    done

    # Config files
    msg=">>> .config directory does not exist. Creating one."
    emsg=">>> .config already exists."
    [ ! -d "$CONFIG_DIR" ] && echo "$msg" && ls "$CONFIG_DIR" || echo "$emsg"

    for file in "$HOME"/dotfiles/config/*;do
        echo "Link: $file"
        ln -s "$file" "$CONFIG_DIR"
    done
}

# From Dotfiles
strap_up

# Application Install
if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo ">>> Running MacOS Bootstrap"
    # check_homebrew_install
    # install_from_brewfile
else
    echo ">>> Running $OS_TYPE Bootstrap"
    # some_linux_install_script
fi
