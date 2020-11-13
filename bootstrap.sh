#!/bin/bash

# turn on "strict mode"
set -euo pipefail

dotfiles_dir="$(pwd)"
setup_dir="${dotfiles_dir}/setup"
utils="${setup_dir}/utils.sh"
backup="${dotfiles_dir}_old"

source "$utils"

symlink_dotfiles() {
  display_message "Symlinking dotfiles..."
  bash "$setup_dir/symlinks.sh"
  display_message "...done symlinking"
}

install_plugins() {
  display_message "Installing vim plugins..."
  vim +'PlugInstall --sync' +qa
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

setup_os() {
  if [ "$(uname -s)" == "Darwin" ]; then
    display_message "Setting up MacOS"
    bash "$setup_dir/mac/macos"
    display_message "...done with MacOS"
    display_message "You may need to restart your machine for all changes to take place."
  elif [ "$(uname -s)" == "Linux" ]; then
    display_message "Setting up Linux..."
    if [[ $* == *--testing* ]]; then
      echo "Skipping apt install in testing environment"
    else
      bash "$setup_dir/linux/apt-install.sh"
    fi
    display_message "...done with Linux"
  fi
}

bootstrap() {
  display_message "Bootstrapping dotfiles..."
  symlink_dotfiles
  testing=false
  for i in "$@"
  do
  case $i in
      -v=*|--vim-plugins=*)
      install_plugins
      shift # past argument=value
      ;;
      -j=*|--jupyter=*)
      setup_jupyter
      shift
      ;;
      -t=*|--testing=*)
      testing=true
      shift
      ;;
      -b=*|--brew=*)
      if [ "$(uname -s)" == "Darwin" ]; then
        install_brew
      fi
      shift
      ;;
      *)
            # unknown option
      ;;
  esac
  done
  if [ testing ]; then
    setup_os --testing
  else
    setup_os
  fi
  display_message "...done bootstrapping"
}

bootstrap
