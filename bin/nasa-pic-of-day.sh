#!/usr/local/bin/bash
PATH=/usr/local/bin:$PATH

base='http://apod.nasa.gov/apod/'
wget -O /tmp/nasa ${base}astropix.html
href=${base}`cat /tmp/nasa | grep -i '<img' | awk -F '"' '{print $2}'`
ext=${href##*.}
file=/Users/harttle/Pictures/nasa/`date +"%Y-%m-%d"`.$ext

echo downloading $href ...
wget -O $file $href

