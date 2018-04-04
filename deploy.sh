#!/bin/sh

srv=`cat ./heroku.csv`
while IFS= read -r var
do

  IFS="	" read -r -a array <<< "$var"
  rm -rf ./whois
  #sleep 1
  echo ${array[2]} > whois

  echo  ${array[0]} ${array[1]} ${array[2]} ${array[3]}

  git init  > /dev/null
  git add --all  > /dev/null
  git add .  > /dev/null
  git commit -m 'askme'  > /dev/null
  git remote add ${array[2]} https://heroku:${array[3]}@git.heroku.com/${array[2]}.git  > /dev/null
  git push -f ${array[2]} master  > /dev/null
  #curl -sSXGET https://${array[2]}.herokuapp.com
  #exit;
  #sleep 1
done < "./heroku.csv"
