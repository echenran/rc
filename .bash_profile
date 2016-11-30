#!/usr/bin/env bash

# Moving window to the bottom of the screen
osascript -e 'tell application "Terminal"' -e 'set position of front window to {0, 460}' -e 'end tell'

# Setting background picture test
osascript -e 'tell application "Finder"' -e 'set desktop picture to POSIX file "/your/filename.jpg"' -e 'end tell'

# Customising prompt
export PS1='\e[0;37m\u@\w \$\e[0m '

# Setting PATH for Python 3.4
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/usr/local/cuda/bin:/Developer/NVIDIA/CUDA-8.0/bin/:${PATH}"

# Setting editor
export EDITOR=vim

# Allows for extended regexes
shopt -s extglob

source /Users/ecr/.bash_alias
source ~/.bash_functions
source ~/.bash_priv
#banner -w 40 "thanks, thanks"

# Exports global IP to env var

# A rainbow, random ascii image from cowsay prints the dynamic IP and the reading assignment for CPSC223
export cow=$(ls /opt/local/share/cowsay/cows | gshuf | head -1)
> cowsay.txt
echo "Current IP address: $(ip)" >> cowsay.txt
echo "" >> cowsay.txt
cat ~/.todo >> cowsay.txt
read223 >> cowsay.txt
cat cowsay.txt | cowsay -f $cow | lolcat
