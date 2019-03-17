source ~/.profile
source ~/dotfiles/setup/bash/.aliases
source ~/dotfiles/setup/bash/.functions
source ~/dotfiles/setup/bash/.inputrc
# Must import functions before bashrc
source ~/dotfiles/setup/bash/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
