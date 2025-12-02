# Leaving this until I have a better home for it
autoload -U +X bashcompinit && bashcompinit

# Where the magic happens whenever we can clear up the above stuff.
export DOTFILES=~/dotfiles

# Source all files to "source"
# shellcheck source=~
for file in "$DOTFILES"/source/*; do
    source "$file"
done

unset file;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
