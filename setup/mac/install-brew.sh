#!/bin/bash

##########################################
# NOTE: This is only intended for Mac OS #
##########################################

set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
setup_dir="$( dirname "$dir" )"
dotfiles_dir="$( dirname "$setup_dir")"
BREWFILE="$dotfiles_dir/Brewfile"

source "$setup_dir/utils.sh"

bundle() {
  brew tap Homebrew/bundle
  brew bundle install --file="$BREWFILE"
}

# To learn more about brew, check out https://github.com/Homebrew/homebrew-bundle
# Install xcode command line tools if it is not
install_xcode_tools() {
    command -v xcode-select >/dev/null 2>&1 || { echo >&2 "Installing Xcode Command Line Tools Now"; \
    xcode-select --install; }
}

# Check to see if Homebrew is installed, and install it if it is not
install_homebrew() {
    command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }
}

install_xcode_tools
install_homebrew
# Make sure we’re using the latest Homebrew.
brew update
# Install or upgrade apps in Brewfile
bundle

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/basha256sum"

