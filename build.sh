#!/bin/bash
FILE=plugin.video.animeanime
VERS=`cat addon.xml | egrep -o 'animeanime" version="[0-9\.]+' | sed -e 's/animeanime" version="//ig'`
rm *.zip $FILE
mkdir $FILE
cp -R ./* $FILE
zip -r ../$FILE-$VER.zip ./$FILE
rm -fR $FILE
scp ../$FILE-$VER.zip  ds-2:/volume1/web/repo/zips
rsync -r ./ ds-2:/volume1/web/repo/plugin.video.animeanime
mv ../*.zip .
