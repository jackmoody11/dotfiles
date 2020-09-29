import os
import sys
import platform

from setup.utils import prompt

HERE = os.path.dirname(os.path.abspath(__file__))
SETUP_DIR = os.path.join(HERE, "setup")
SUPPORT = os.path.join(SETUP_DIR, "support")
BACKUP = "{here}_old".format(here=HERE)


def symlink_dotfiles():
    """Creates all symlinks needed for dotfiles. """
    print("Symlinking dotfiles...")
    os.system("sh {setup_dir}/symlinks.sh".format(setup_dir=SETUP_DIR))
    print("...done symlinking")


def install_plugins():
    """Installs all vim plugins for vim-plug. """
    print("Installing vim plugins...")
    os.system("vim +PlugInstall +qall")
    print("...done with plugins")


def setup_jupyter():
    """Adds Jupyter extensions. """
    if prompt("Do you need to add jupyter extensions?"):
        print("Setting up Jupyter extensions...")
        os.system(
            "sh {setup_dir}/jupyter/jupyter.sh".format(setup_dir=SETUP_DIR))
        print("...done with Jupyter")


def setup_homebrew():
    """Runs brew install on Brewfile. """
    if prompt("Do you need to install homebrew and brewfiles?"):
        print("Setting up Homebrew...")
        os.system(
            "sh {setup_dir}/mac/install-brew.sh".format(setup_dir=SETUP_DIR))
        print("...done with Homebrew")


def setup_mac():
    """Sets mac preferences from macos file. """
    if prompt("Do you need to set up your mac preferences?"):
        print("Setting mac preferences...")
        os.system("sh {setup_dir}/mac/macos".format(setup_dir=SETUP_DIR))
        print("...done with preferences")
        print("You may need to restart your machine for all changes to take place.")


if __name__ == '__main__':
    os.system("source {support}".format(support=SUPPORT))
    if prompt("Are you sure you want to continue bootstrapping dotfiles?"):
        symlink_dotfiles()
        install_plugins()

        if platform.system() == "Darwin":
            setup_homebrew()
            setup_mac()
        setup_jupyter()
    else:
        sys.exit("Aborting bootstrap")
