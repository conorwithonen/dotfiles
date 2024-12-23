function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}

autoload -U colors && colors
setopt PROMPT_SUBST
export PROMPT='%F{fg[7]}%n%f %F{211}%2~%f %F{green}$(parse_git_branch)%f$ '
