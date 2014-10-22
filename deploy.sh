#!/bin/bash

#backup old
echo "..backing up old project"
timestamp=$(date +"%Y%m%d%H%M")
zip -r ../play_apps/bkp/"$1".$timestamp.zip ../play_apps/"$1"

#kill old pid
echo "..killing running pid"
running_pid=$(head -n 1 ../play_apps/$1/RUNNING_PID)
kill -9 $running_pid

#remove old directory
echo "..removing old $1"
rm -r ../play_apps/$1

#unzip
echo "..unzipping new $1 to /play_apps"
unzip "$1".zip -d ../play_apps

#startup
echo "..starting app"
screen -d -m ../play_apps/"$1"/bin/jmaat -mem 56  -Dconfig.file=../play_apps/"$1"/conf/application.conf
sleep 2
running_pid=$(head -n 1 ../play_apps/$1/RUNNING_PID)

echo "Deployment Complete! - new pid $running_pid"