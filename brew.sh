#!/usr/bin/env bash

##########################################
# NOTE: This is only intended for Mac OS #
##########################################

# Install xcode command line tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

########################################
################# Taps #################
########################################

brew tap "caskroom/cask"
brew tap "caskroom/eid"
brew tap "caskroom/fonts"
brew tap "caskroom/versions"
brew tap "homebrew/bundle"
brew tap mas-cli/tap
brew tap-pin mas-cli/tap

########################################
############# Development ##############
########################################

brew install "automake" # Add make command for GNU compliant Makefiles
brew install "bash" # Bash 4
brew install "git" # Add git
brew install "libyaml" # YAML parser
brew install "mysql" # Add MySQL
brew install "node" # Add node.js
brew install "openssl" # Add TLS and SSL protocols
brew install "pearl" # Add pearl
brew install "php" # Add PHP
brew install "pre-commit" # Run commands before committing changes made in git repository
brew install "python" # Add Python
brew install "postgresql" # Add Postgresql
brew install "sphinx-doc" # Enable Sphinx documentation for Python projects
brew install "sqlite" # Add SQLite
brew install "redis" # Add redis
brew install "ruby" # Add ruby
brew install "vim" # Add VIM
brew install "zsh" # Add ZSH shell
brew install "zsh-completions" # Add ZSH completions

########################################
############ External CLIs #############
########################################

brew tap "heroku/homebrew-brew" # Add heroku CLI
brew install "awscli" # Official AWS CLI

########################################
########## Image Manipulation ##########
########################################

brew install "imagemagick" # Image manipulation from the command line
brew install "libtiff" # Reading, writing, and manipulating TIFFs

########################################
####### Other Command Line Tools #######
########################################

brew install "freetype" # Software to render fonts
brew install "libtool" # Generic library support script
brew install "xz" # Data compression with high compression ratio
brew install "autoconf"
brew install "bat" # cat replacement with syntax highlighting
brew install "coreutils" # Those that come with macOS are outdated
brew install "grep" # Add grep functionality (ex: `grep 'search_term' filename`)
# brew install "mackup" # use for syncing mac application settings through something like Dropbox
# https://github.com/lra/mackup

brew install "pkg-config" # Helper tool often used when installing apps and libraries
brew install "tree" # Recursive directory listing

########################################
################# Apps #################
########################################

brew install "mas" # Make installing apps from the App Store easier
# https://github.com/mas-cli/mas
cask "docker"
cask "firefox"
cask "google-backup-and-sync"
cask "google-chrome"
cask "java"
cask "sublime-text"
cask "brackets"
cask "alfred"
cask "adobe-acrobat-pro"
cask "pycharm"
cask "texmaker"
mas install 1176895641 # Install Spark application used for emails


########################################
################  Fonts ################
########################################
cask "font-lato"
cask "font-open-sans"
cask "font-roboto"
cask "font-source-code-pro-for-powerline"
cask "font-source-code-pro"
cask "font-source-sans-pro"
cask "font-source-serif-pro"
