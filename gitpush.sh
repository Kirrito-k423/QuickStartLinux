#!/bin/bash
set -v
set -e

bigfile=$(find . -type f -size 100M|wc -l)
echo "$bigfile"
if [[ "$bigfile" == '0' ]];then
    git add .
    read commit
    echo "$commit"
    git commit -m "$commit"
    git push -u origin main
else
    echo "big file"
fi