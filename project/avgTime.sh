set -e
set -v
shPATH=`pwd`
Program="SLIC"
echo $Program
LogFile="${Program}_`date +"%Y-%m-%d_%H_%M_%S"`.log"
echo $LogFile
cd build/bin/
for ((j = 1 ; j < 64 ; j++));
  for ((i = 0 ; i < 10 ; i++)); do
    OMP_NUM_THREADS=$j ./$Program >> $shPATH/log/$LogFile
  done
  cat $shPATH/log/$LogFile |awk '$2!="are" {print $2}'|sed 's/^time=//g'|sed '1,5d'|awk '{a+=$1}END{print a/NR}'
  output=`cat $shPATH/log/$LogFile |awk '$2!="are" {print $2}'|sed 's/^time=//g'|sed '1,5d'|awk '{a+=$1}END{print a/NR}'` 
  echo -n "${output}, " >> chartData.txt # -n 代表的就是不生成换行符
done
# awk找到时间行，sed找出时间数字，awk计算
# source avgTime.sh

## 结合 cluster/autoBestNumTest一起
