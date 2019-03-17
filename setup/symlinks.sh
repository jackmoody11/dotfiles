########################################
################# Vim ##################
########################################

ln -sF ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/setup/vim/.vimrc ~/.vimrc

########################################
############ Sublime Text ##############
########################################

# Install Sublime Text settings (force overwrite if they exist)
ln -sF ~/dotfiles/init/st3/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sF ~/dotfiles/init/st3/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User


########################################
############### VS Code ################
########################################
# Reference: https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
# Create symlinks to settings
ln -sf ~/dotfiles/init/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 
ln -sF ~/dotfiles/init/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

########################################
############### General ################
########################################

# Add .inputrc
ln -sf ~/dotfiles/setup/bash/.inputrc ~/.inputrc

# Add .hushlogin
ln -sf ~/dotfiles/setup/mac/.hushlogin ~/.hushlogin

# Add .bash_profile
ln -sf ~/dotfiles/setup/bash/.bash_profile ~/.bash_profile

# Add .bashrc
ln -sf ~/dotfiles/setup/bash/.bashrc ~/.bashrc

# Add .jupyter/
ln -sF ~/dotfiles/.jupyter ~/.jupyter
