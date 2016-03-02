#!/usr/local/bin/bash
PATH=/usr/local/bin:$PATH

echo ----------------------------------------------------------------
echo 'Fetching NationalGeo photo of the day...'
date

wget -O /tmp/ngeo http://photography.nationalgeographic.com/photography/photo-of-the-day
href=http:`cat /tmp/ngeo | grep 990 | grep 742 | awk -F '"' '{print $2}'`
ext=${href##*.}
file=/Users/harttle/Pictures/ngeo/`date +"%Y-%m-%d"`.$ext

echo downloading $href ...
wget -O $file $href

# echo $href | mail -v -s "NGEO Photo of the Day" yangjvn@126.com huozhuojun91@163.com

