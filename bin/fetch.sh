#!/bin/sh

# fetch.sh - download the most recent dump files from the getty research portal
# requires wget and xq (on macos: `brew install wget python-yq`)

CUR=`dirname $0`
cd $CUR/../tmp

# download index
RS_INDEX="https://portal.getty.edu/resources/json_data/resourcedump.xml"
wget -N $RS_INDEX

LATEST=`xq -r .urlset.url[].loc resourcedump.xml | sed -e's/-part.\.zip//'| sort | uniq | grep -v "\d\d\d\d\d\d\d" | tail -1`
echo $LATEST
FILES=`xq -r .urlset.url[].loc resourcedump.xml | grep $LATEST`
for i in $FILES; do
  echo "$i"
  wget -N $i
  FN=`basename $i`
  unzip -o $FN -x resourcedump_manifest*
done
