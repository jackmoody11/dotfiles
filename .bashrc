# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#################################################
#################### Aliases ####################
#################################################

alias c='clear'
alias tree="tree -C"

# -F displays `/`for directories, `*` for executables, etc...
alias ls='ls -F'
alias ls.='ls -Fd .*' # Show dotfiles and hide others
alias ~="cd ~" # Make it easier to go to root

# Git
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"

# For going up multiple directories
alias cd..='cd ..' # For mistyping
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Track CPU usage
alias cpu="top -F -R -o cpu"

# Open applications
alias google="open -a 'Google Chrome'"
alias spotify="open -a Spotify"


# If you ever need to remove Last Login message
# Use `touch .hushlogin`

######################################################
#################### Color Scheme ####################
######################################################

# Turn on CLI colors
export CLICOLOR=1

# Colors
black="\[$(tput setaf 0)\]"
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"

# Title bar - "user@host: ~"
title="\u@\h: \w"
titlebar="\[\033]0;"$title"\007\]"

# Clear attributes
clear_attributes="\[$(tput sgr0)\]"

###################################################
#################### Functions ####################
###################################################

# Git add and commit
function gac(){
    git add . && git commit -m "$1"
}

function gacp() {
    git add . && git commit -m "$1" && git push
}

# Show git branch on command line
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /';
}

# Custom bash prompt - "➜  ~ (master) "
export PS1="${titlebar}${green}➜  ${blue}\W ${cyan}\$(git_branch)${clear_attributes}"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash
