#!/usr/bin/env bash

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
  takennames=$(ls | grep -e $pname)
  while [ "$takennames" != "" ]
  do
    echo -n "Already taken: $takennames Enter alternate name: ";
    read altname;
    pname="$altname";
    takennames=$(ls | grep -e $pname);
  done 
  curl -s ${1} | grep "<meta content='https://d" | tr "\n" " " | sed "s/<meta content='//g" | sed "s/'.*$//g" | xargs wget -O $pname".jpg";
}
