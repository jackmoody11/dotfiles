#!/bin/sh

# turn on "strict mode"
set -euo pipefail

dotfiles_dir="$(pwd)"
setup_dir="${dotfiles_dir}/setup"
support="${setup_dir}/support"
backup="${dotfiles_dir}_old"

source "$support"

confirm_bootstrap() {
  display_message "Are you sure you want to continue bootstrapping dotfiles?"
  read -n 1 -p "[y/n]> " install && echo
  input_matches_yY "$install"
}

confirm_brew() {
  display_message "Do you need to install homebrew and brewfiles?"
  read -n 1 -p "[y/n]> " install && echo
  input_matches_yY "$install"
}

confirm_jupyter() {
  display_message "Do you need to add jupyter extensions?"
  read -n 1 -p "[y/n]> " install && echo
  input_matches_yY "$install"
}

symlink_dotfiles() {
  display_message "Symlinking dotfiles..."
  bash "$setup_dir/symlinks.sh"
  display_message "...done symlinking"
}

install_plugins() {
  display_message "Installing vim plugins..."
  vim +PlugInstall +qall
  display_message "...done with plugins"
}

install_brew(){
  display_message "Setting up Homebrew"
  bash "$setup_dir/mac/install-brew.sh"
  display_message "...done with Homebrew"
}

setup_jupyter(){
  display_message "Setting up Jupyter extensions..."
  bash "${setup_dir}/jupyter/jupyter.sh"
  display_message "...done with Jupyter"
}

setup_mac() {
  # Only set mac defaults if on a mac computer
  if [ "$(uname -s)" == "Darwin" ]; then
    install_brew
    display_message "Setting mac preferences"
    bash "$setup_dir/mac/macos"
    display_message "...done with preferences"
    display_message "You may need to restart your machine for all changes to take place."
  fi
}

bootstrap() {
  display_message "Bootstrapping dotfiles..."
  symlink_dotfiles
  install_plugins
  setup_mac
  setup_jupyter
  display_message "...done bootstrapping"
}

bootstrap
