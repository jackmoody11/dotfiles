#!/usr/bin/env bash
setup_dir="$(pwd)"
dotfiles_dir="$(dirname "$setup_dir")"
support="$setup_dir/support"
backup="${dotfiles_dir}_old"

source "$support"
# Set symlinks for files and folders
declare -A files=(
  [bash]=.bash
  [bash_profile]=.bash_profile
  [bashrc]=.bashrc
  [hushlogin]=.hushlogin
  [jupyter]=.jupyter
  [tmux.conf]=.tmux.conf
  [vim]=.vim
)

create_backup_dir() {
  display_message "Creating $backup for backup of any existing files in $HOME..."
  mkdir -p "$backup"
  display_message "...done"
}

clean_backup_dir() {
  display_message "Cleaning out $backup to hold fresh backups..."
  find "$backup" -not -path "$backup" -delete
  display_message "...done"
}

verify_directory() {
  display_message "Checking for the $dotfiles_dir directory..."
  if [[ "$(pwd)" == "$dotfiles_dir" ]]; then
    display_message "...Found $dotfiles_dir directory"
    true
  else
    display_message "...Failed to find $dotfiles_dir"
    false
  fi
}

backup_file() {
  if [[ -e ~/"${files[$1]}" || -h ~/"${files[$1]}" ]]; then
    mv ~/"${files[$1]}" "$backup"/"${files[$1]}"
  fi
}

symlink_file() {
  ln -s "$dotfiles_dir"/links/"$1" ~/"${files[$1]}"
}

# handle the file by moving it to backup and symlinking
# args: 1: dotfile key (that is, the name it has in this repo)
handle_file() {
  display_message "Starting ${files[$1]}..."
  display_message "Moving ${files[$1]} from $HOME to $backup"
  backup_file "$1"
  display_message "Creating symlink to ${files[$1]} in $HOME"
  symlink_file "$1"
  display_message "...Finished ${files[$1]}"
}

handle_files() {
  for file in "${!files[@]}"; do
    handle_file "$file"
    sleep 1
  done
}

makesymlinks() {
  if ! verify_directory ; then
    exit
  fi
  create_backup_dir
  clean_backup_dir
  handle_files
}

makesymlinks
