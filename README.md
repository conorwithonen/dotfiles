```
▓█████▄  ▒█████  ▄▄▄█████▓  █████▒██▓ ██▓    ▓█████   ██████ 
▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓██   ▒▓██▒▓██▒    ▓█   ▀ ▒██    ▒ 
░██   █▌▒██░  ██▒▒ ▓██░ ▒░▒████ ░▒██▒▒██░    ▒███   ░ ▓██▄   
░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ░▓█▒  ░░██░▒██░    ▒▓█  ▄   ▒   ██▒
░▒████▓ ░ ████▓▒░  ▒██▒ ░ ░▒█░   ░██░░██████▒░▒████▒▒██████▒▒
 ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░    ▒ ░   ░▓  ░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░
 ░ ▒  ▒   ░ ▒ ▒░     ░     ░      ▒ ░░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░
 ░ ░  ░ ░ ░ ░ ▒    ░       ░ ░    ▒ ░  ░ ░      ░   ░  ░  ░  
   ░        ░ ░                   ░      ░  ░   ░  ░      ░  
 ░                                                           

```

## Finally
I'm finally starting a dotfiles repo and it's going to be a healthy mix of stealing from others and my own stuff. No shame as I don't think I'm going to make this usable for anyone else.

## Structure
I'm starting with a few main directories.
### Link
Everything that needs to have a symlink created in ~/
### Copy
Everything that needs to be copied to ~/. This will be for files that want to be managed by git but still need some personal stuff added once copied. Think .gitconfig with my email address. 
### Source
Everything to be sourced by the `.zshrc` once it is linked in the root. Prompt, aliases, etc...
#### Work.sh
Things that I want to be able to use, but never tracked in git. Ex. Aliases and scripts that have to do with internal work stuff.
## TODO
- Create file that runs everything and break into steps (copy, link, config, init, etc...)
- Make config dir from dotfiles reachable by env (~/.config link maybe)
- Brew packages
