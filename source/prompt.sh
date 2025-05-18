# Starship prompt. See ~/.dotfiles/config/starship.toml
UNAME=$(uname)
case $UNAME in
    Linux*)
        eval "$(starship init bash)"
        ;;
    *)
        eval "$(starship init zsh)"
        ;;
esac
