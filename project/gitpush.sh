#!/bin/bash
set -v
set -eux 
# -x 　执行指令后，会先显示该指令及所下的参数。
# -u 　当执行时使用到未定义过的变量，则显示错误信息。

bigfile=$(find . -type f -size 100M|wc -l)
echo "$bigfile"
if [[ "$bigfile" == '0' ]];then
    git add .
    read commit
    echo "$commit"
    git commit -m "$commit"
    git push
else
    echo "big file"
fi