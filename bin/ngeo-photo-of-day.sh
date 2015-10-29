#!/usr/local/bin/bash
PATH=/usr/local/bin:$PATH

wget -O /tmp/ngeo http://photography.nationalgeographic.com/photography/photo-of-the-day
href=http:`cat /tmp/ngeo | grep 990 | grep 742 | awk -F '"' '{print $2}'`
ext=${href##*.}
file=/Users/harttle/Pictures/ngeo/`date +"%Y-%m-%d"`.$ext

echo downloading $href ...
wget -O $file $href

