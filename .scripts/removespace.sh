#!/bin/bash
#
#Replace spaces and brackets '[]' and other crap '@#$&,()'with '_' in current directory
#Author - Blackbeard

#for f in *; do
#    g=$(echo $f | sed "s/\[\|\]\|(\|)\| \|\&\|\,\|\\$\|\@\|-/_/g" | sed "s/'//g" | sed "s/__\|___/_/g");
#    echo mv -- "$f" "$g"
#done

# find . -name '*' -print0 |
# while IFS= read -r -d '' f; do
#     g=$(echo $f | sed "s/\[\|\]\|(\|)\| \|\&\|\,\|\\$\|\@\|-/_/g" | sed "s/'//g" | sed "s/__\|___/_/g");
#     mv -- "$f" "$g"
# done

find . -name '*' | while read -r f; do
    n=$( echo $f | sed "s/\[\|\]\|(\|)\| \|\&\|\,\|\\$\|\@\|-/_/g" | sed "s/'//g" | sed "s/__\|___/_/g");
    mv "$f" "$n";
done

exit 0
