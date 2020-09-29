import os
import sys

HOME = os.path.expanduser("~")
SETUP_DIR = os.path.dirname(os.path.abspath(__file__))
DOTFILES_DIR = os.path.dirname(SETUP_DIR)
BACKUP = os.path.join(HOME, "dotfiles_old")


def create_backup_dir():
    print(f"Creating {BACKUP} for backup of any existing files in {HOME}")
    os.system(f"mkdir -p {BACKUP}")


def clean_backup_dir():
    print(f"Cleaning out {BACKUP} to hold fresh backups")
    os.system(f"rm -r {BACKUP}")


def verify_directory():
    print(f"Checking for the {DOTFILES_DIR} directory")
    if os.path.exists(DOTFILES_DIR):
        print(f"Found {DOTFILES_DIR} directory")
        return True
    else:
        print(f"Failed to find {DOTFILES_DIR}")
        return False


def backup_file(file):
    if os.path.exists(file):
        os.system(f"mv {file} {BACKUP}/{file}")
        print(f"{file} => {BACKUP}/{file}")


def symlink_file(file):
    link = os.path.join(DOTFILES_DIR, "links", file)
    os.system(f"ln -s {link} ~/.{file}")
    print(f"{link} => ~/.{file}")


def handle_file(file):
    backup_file(file)
    symlink_file(file)


def make_symlinks(**files):
    for directory, directory_files in files.items():
        if not verify_directory():
            sys.exit()
        create_backup_dir()
        clean_backup_dir()
        for file in directory_files:
            if directory == ".":
                path = file
            else:
                path = os.path.join(directory, file)
                print(path)
            handle_file(path)


if __name__ == "__main__":
    files = {
        "bash": ["aliases", "functions", "inputrc"],
        "vim": ["vimrc"],
        ".": ["hushlogin", "hyper.js", "tmux.conf", "bashrc", "bash_profile"]
    }
    make_symlinks(**files)
