site='http://herricks.org/webpages/jmcmanus/'
file=$(curl 'http://herricks.org/webpages/jmcmanus/appsych.cfm?subpage=11599' | grep 'files/' | sed 's/.*files/files/g' | sed 's/"\>.*$//g' | sed -e :a -e '$q;N;2,$D;ba')
site=$site$file
ext="${site:${#str}-3}"

cd ~/Documents/school/12\(2015-16\)/APPsych
rm hh*
if [ $ext = "pdf" ]
then
    wget -O "hh.pdf" $site
    chmod 777 hh.pdf
elif [ $ext = "doc" ]
then
    wget -O "hh.doc" $site
    chmod 777 hh.doc
else
    wget -O "hh" $site
fi
