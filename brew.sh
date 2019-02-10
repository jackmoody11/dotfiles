#!/usr/bin/env bash

##########################################
# NOTE: This is only intended for Mac OS #
##########################################

# Run `sh brew.sh` to run script

# Install xcode command line tools if it is not
command -v xcode-select >/dev/null 2>&1 || { echo >&2 "Installing Xcode Command Line Tools Now"; \
xcode-select --install; }

# Check to see if Homebrew is installed, and install it if it is not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install or upgrade apps in Brewfile
brew bundle

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

mas install 1176895641 # Install Spark application used for emails
pip3 install jupyter # Install Jupyter for Python
