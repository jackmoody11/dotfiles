########################################
################# Vim ##################
########################################

ln -sf ~/dotfiles/.vim ~/.vim


########################################
############ Sublime Text ##############
########################################

# Install Sublime Text settings (force overwrite if they exist)
ln -sf ~/dotfiles/init/st3/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf ~/dotfiles/init/st3/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User


########################################
############### VS Code ################
########################################
# Reference: https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
# Create symlinks to settings
ln -sf ~/dotfiles/init/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 
ln -sf ~/dotfiles/init/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

########################################
############### General ################
########################################

# Add .inputrc symlink
ln -sf ~/dotfiles/.inputrc ~/.inputrc

# Add .hushlogin
ln -sf ~/dotfiles/.hushlogin ~/.hushlogin

# Add .bash_profile
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

# Add .bashrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
