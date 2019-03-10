#!/usr/bin/env bash

# turn on "strict mode"
set -euo pipefail

dotfiles_dir="$(pwd)"
setup_dir="${dotfiles_dir}/setup"

source "$dotfiles_dir/dotfiles-support"

confirm_bootstrap() {
  display_message "Are you sure you want to continue bootstrapping dotfiles?"
  read -n 1 -p "[y/n]> " install && echo
  input_matches_yY "$install"
}

symlink_dotfiles() {
  display_message "Symlinking dotfiles..."
  bash "$setup_dir/symlinks.sh"
  display_message "...done symlinking"
}

install_software() {
  display_message "Running installers..."
  bash "$setup_dir/install-all.sh"
  display_message "...done with installers"
}

install_plugins(){
    display_message "Installing vim plugins..."
    vim +PlugInstall +qall
    display_message "...done with plugins"
}

set_mac_defaults(){
    display_message "Setting mac preferences"
    bash .macos
    display_message "...done with preferences"
    display_message "You may need to restart your machine for all changes to take place."
}

bootstrap() {
  display_message "Bootstrapping dotfiles..."
  symlink_dotfiles
  install_software
  install_plugins
  set_mac_defaults
  display_message "...done bootstrapping"
}

if confirm_bootstrap; then
  bootstrap
else
  display_message "Aborting bootstrap"
fi