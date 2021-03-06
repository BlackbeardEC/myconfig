#!/bin/bash
# convert filenames to lowercase
# and replace characters recursively
# usage sh removespace.sh [directory]
#####################################

if [ -z $1 ];then 
    echo Give target directory; 
    exit 0;
fi

find "$1" -depth -name '*' | while read file ; do
     directory=$(dirname "$file")
     oldfilename=$(basename "$file")
     newfilename=$(echo "$oldfilename" | tr 'A-Z' 'a-z' | tr ' ' '_' | tr '(' '' | tr ')' '' | sed s/_-_/_/g)
     #newfilename=$(echo "$oldfilename" | sed s/_-_/_/g)
     #newfilename=$(echo "$oldfilename" | tr 'A-Z' 'a-z')
     #newfilename=$(echo "$oldfilename" | tr ' ' '_')
     if [ "$oldfilename" != "$newfilename" ]; then
          mv -i "$directory/$oldfilename" "$directory/$newfilename"
          echo ""$directory/$oldfilename" ---> "$directory/$newfilename""
     fi
done
exit 0
