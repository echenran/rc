#!/usr/bin/env bash

#gpg encrypt to ASCII armor
gpge () {
	gpg -r "${1}" --armor -se "${2}"
}

#download to mp3 from youtube video
yt2mp3 () {
  youtube-dl -x --audio-format mp3 "${1}"
}

#change volume
v () {
  osascript -e "set volume ${1}"
}

#pastebin to sprunge.us
sprunge () {
        pastebinit -b sprunge.us ${1:--}
}

#pastebin to ptpb.pw
pb () {
        curl -F "c=@${1:--}" https://ptpb.pw
}

#thesaurus from dict module
syn () {
        dict ${1} | tr '\n' ' ' | sed 's/^.*From Moby/From Moby/g' | sed 's/ From.*$//g' | sed 's/, */, /g'
}

#steal wallpaper from that 500px.com site...until they change their single quotes to double quotes again anyway
wp () {
  pname="${2}"
  takennames=$(ls | grep -ie $pname)
  while [ "$takennames" != "" ]
  do
    echo -n "Already taken: $takennames Enter alternate name: ";
    read altname;
    pname="$altname";
    takennames=$(ls | grep -ie $pname);
  done 
  curl -s ${1} | grep "<meta content='https://d" | tr "\n" " " | sed "s/<meta content='//g" | sed "s/'.*$//g" | xargs wget -O $pname".jpg";
}

#Checks if a file name is taken; if not, starts a new executable
new () {
  fname="${1}"  
  files=$(ls | grep -e $fname)
  while [ "$files" != "" ]
  do
    echo "The following filenames are already taken: $files";
    echo -n "Enter r [file] to read, x [file] to replace, or start a new file: ";
    read altname;
    if [ $# == 2 && "${1}" == "r" ]; then
      cat $altname;
      echo -n "Enter x to replace or start a new file: ";
      read altname;
    elif [ $# == 2 && "${1}" == "x" ]; then
      rm $altname;
    else
      fname="$altname";
    fi
    files=$(ls | grep -e $fname)
  done
  touch $fname
  chmod a+x $fname
  vim $fname
}

#Converts Celsius to Fahrenheit
c2f () {
  echo ${1}*1.8+32|bc
}

#Converts Fahrenheit to Celsius
f2c () {
  echo $(echo ${1}-32|bc)*.555|bc
}

#Converts pounds to Newtons
lb2n () {
	echo ${1}*4.4|bc
}

#Converts Newtons to pounds
n2lb () {
	echo ${1}*.225|bc
}

#Interacts with countdown.py and ~/.countdowns to add, remove, and list countdowns
#Where ~/.countdowns is in the format:
# name=15 Dec 2015
# name1=8 May 2016
cdown() {
  if [ $# == 0 ]; then
    if [ "$PWD" != "/Users/ecr" ]; then
      tempdir="$PWD";
      cd ~;
      ./countdown.py;
      cd $tempdir;
      unset tempdir;
    else
      ./countdown.py;
    fi
  elif [ "$1" == "-a" ]; then
    countdown="$2";
    results=$(cat ~/.countdowns | grep -ie "$countdown");
    if [ "$results" != "" ]; then
      echo "These countdowns have similar names: ";
      echo "$results";
      echo -n "Enter final name for countdown: ";
      read final;
      countdown="$final";
    fi
    echo "$countdown=$3 $4 $5" >> ~/.countdowns;
  elif [ "$1" == "-d" ]; then
    countdown="$2";
    results=$(cat ~/.countdowns | grep -ie "$countdown");
    if [ "$results" != "" ]; then
      echo "These countdowns have similar names: ";
      echo "$results";
      echo -n "Enter the exact name of the countdown to remove: ";
      read final;
      countdown="$final";
    fi
    tempcountdowns=$(cat ~/.countdowns | sed "/$countdown\=/d");
    rm ~/.countdowns;
    echo "$tempcountdowns" > ~/.countdowns;
  fi
}
