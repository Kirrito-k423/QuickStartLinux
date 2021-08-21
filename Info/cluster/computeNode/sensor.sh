#!/bin/bash
sensors|awk '$3 ~ /[0-2][0-9]/ {print $3}'|sed 's/^+//g'|sed 's/\.0.*//g'
checkTemp=`sensors|awk '$3 ~ /[0-1][0-9]/ {print $3}'|sed 's/^+//g'|wc -l` # 注意这里是不是引号，是波浪线同键位
echo $checkTemp
while [[ "$checkTemp" == "0" ]]; do #判断的时候注意空格
    echo "Temperature is too high!"
    sleep 5
    sensors
    checkTemp=`sensors|awk '$3 ~ /[0-2][0-9]/ {print $3}'|sed 's/^+//g'|wc -l`
done

