# If this file get's too unruly, split it up into scoped files per use in the same directory
# Easier navigation:
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
# Git
alias g="git"
alias glog="git log"
alias glogo="git log --oneline"


# Old
alias ipython='python3 -m IPython'
alias python='python3'
alias pip='pip3'
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias mkvenv='python3 -m venv venv && source ./venv/bin/activate'

# Misc -
# Lock the screen (when going AFK)
alias afk="pmset displaysleepnow"
# IP addresses
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
