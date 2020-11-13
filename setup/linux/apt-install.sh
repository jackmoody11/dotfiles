#!/bin/bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

download_sudo_apt_things() {
  # Download all apt packages that need to be downloaded with sudo
  sudo apt install -y $(grep -vE "^\s*#" "${DIR}/sudo-apt-installs.txt" | tr "\n" " ")
}


########## Main ##########
download_sudo_apt_things
