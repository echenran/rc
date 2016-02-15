#!/usr/bin/env bash

# Moving window to the bottom of the screen
osascript -e 'tell application "Terminal"' -e 'set position of front window to {0, 460}' -e 'end tell'

# Customising prompt
export PS1='\e[0;37m\u@\w \$\e[0m '

# Setting PATH for Python 3.4
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:${PATH}"

# Setting editor
export EDITOR=vim

# Allows for extended regexes
shopt -s extglob

# A rainbow, random ascii image from cowsay prints the dynamic IP
cow=$(ls /opt/local/share/cowsay/cows | gshuf | head -1)
ifconfig| grep -e "inet " | xargs echo | cowsay -f $cow | lolcat

source /Users/ecr/.bash_alias
source /Users/ecr/.bash_functions
#banner -w 40 "thanks, thanks"
