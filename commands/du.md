du -h --max-depth=1|awk '$1 ~ /[0-9]*G/ {print $1,$2}'|sort -n -r
