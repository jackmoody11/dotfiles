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

confirm_brew() {
  display_message "Do you need to install homebrew and brewfiles?"
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

setup_mac() {
  # Only set mac defaults if on a mac computer
  if [ "$(uname -s)" == "Darwin" ]; then
    display_message "Setting mac preferences"
    bash "$setup_dir/mac/.macos"
    display_message "...done with preferences"
    if confirm_brew; then
      install_brew
    fi
    display_message "You may need to restart your machine for all changes to take place."
  fi
}

bootstrap() {
  display_message "Bootstrapping dotfiles..."
  symlink_dotfiles
  install_plugins
  setup_mac
  display_message "...done bootstrapping"
}

if confirm_bootstrap; then
  bootstrap
else
  display_message "Aborting bootstrap"
fi
