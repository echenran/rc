#!/usr/bin/env bash

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

c2f () {
  echo ${1}*1.8+32|bc
}

f2c () {
  echo $(echo ${1}-32|bc)*.555|bc
}

cdown() {
  if [ $# == 0 ]; then
    ./countdown.py;
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
