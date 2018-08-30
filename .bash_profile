#!/usr/bin/env bash

source /Users/ecr/.bash_alias
source ~/.bash_functions
source ~/.bash_priv
crontab ~/.crontab

# Moving window to the bottom of the screen
#osascript -e 'tell application "Terminal"' -e 'set position of front window to {0, 460}' -e 'end tell'

parse_git_branch() {
	git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Customising prompt
export PS1='\[\e[0;37m\]\u@\w\[\e[0m\]\[\e[0;33m\]$(parse_git_branch)\[\e[0m\] \[\e[0;37m\]\$\[\e[0m\] '
# Prompt for remote machines
#export PS1='\[\e[0;37m\]\u@\[\e[0m\]\[\e[0;36m\]\h\[\e[0m\]\[\e[0;37m\]:\w\[\e[0m\]\[\e[0;33m\]$(parse_git_branch)\[\e[0m\] \[\e[0;37m\]\$\[\e[0m\] '

export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:\
/usr/local/bin:\
/opt/local/bin:\
/opt/local/sbin:\
/usr/local/texlive/2016basic/bin/universal-darwin:\
/usr/local/cuda/bin:\
/Developer/NVIDIA/CUDA-8.0/bin/:\
/Users/ecr/campus-map/bin:\
${PATH}"
export MANPATH="/usr/local/cuda/man:${MANPATH}"

# Setting editor
export EDITOR=vim

# Allows for extended regexes
shopt -s extglob

# A rainbow, random ascii image from cowsay prints the dynamic IP and todo list
export cow=$(ls /usr/local/Cellar/cowsay/3.04/share/cows/ | gshuf | head -1)
> ~/.cowsay.txt
echo "Current IP address: $(ip)" >> ~/.cowsay.txt
echo "" >> ~/.cowsay.txt
cat ~/.holidays.txt >> ~/.cowsay.txt
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
