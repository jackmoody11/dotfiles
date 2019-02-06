source ~/.profile
source ~/dotfiles/.aliases
source ~/dotfiles/.functions
# Must import functions before bashrc
source ~/dotfiles/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
