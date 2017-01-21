#!/usr/bin/env bash

# Moving window to the bottom of the screen
osascript -e 'tell application "Terminal"' -e 'set position of front window to {0, 460}' -e 'end tell'

parse_git_branch() {
	git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# Customising prompt
#export PS1='\e[0;37m\u@\w\$(parse_git_branch)\$\e[0m '
export PS1='\[\e[0;37m\]\u@\w\[\e[0;33m$(parse_git_branch)\e[0m \[\e[0;37m\]$\[\e[m\] '

# Setting PATH for Python 3.4
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/usr/local/cuda/bin:/Developer/NVIDIA/CUDA-8.0/bin/:${PATH}"
export MANPATH="/usr/local/cuda/man:${MANPATH}"

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
export cow=$(ls /usr/local/Cellar/cowsay/3.04/share/cows/ | gshuf | head -1)
> ~/.cowsay.txt
echo "Current IP address: $(ip)" >> ~/.cowsay.txt
echo "" >> ~/.cowsay.txt
cat ~/.todo >> ~/.cowsay.txt
#read223 >> ~/.cowsay.txt
cat ~/.cowsay.txt | cowsay -f $cow | lolcat

# nvm config stuff
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
        
# add cuda libraries to library path
export LD_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/lib:/usr/lib:/Developer/NVIDIA/CUDA-8.0/lib:${LD_LIBRARY_PATH}
#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/lib:/usr/lib:/Developer/NVIDIA/CUDA-8.0/lib:$DYLD_FALLBACK_LIBRARY_PATH
#export LD_PRELOAD=/usr/lib/libstdc++.6.dylib
#export LD_PRELOAD=/usr/lib/libstdc++.6.0.9.dylib
#export LD_PRELOAD=/usr/lib/libstdc++.dylib
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib\
	${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
