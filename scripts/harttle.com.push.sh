#!/usr/local/bin/bash
PATH=/usr/local/bin:$PATH

echo ----------------------------------------------------------------
echo 'Checking new post to harttle.com...'
date

cd ~/harttle.com
git checkout master
datestr=`date +"%F"`
FILE=`ls _drafts/ | grep $datestr`

if [ -f _drafts/$FILE ];
then
   echo "File $FILE exists. Pushing..."
   mv _drafts/$FILE _posts/$FILE
   git add -A
   git commit -m 'by cron'
   git push
   echo "Push success. Exiting..."
else
   echo "File does not exist. Exiting..."
fi

./scripts/cafe.sh
