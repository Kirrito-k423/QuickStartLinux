set -e
set -v
shPATH=`pwd`
Program="SLIC"
echo $Program
LogFile="${Program}_`date +"%Y-%m-%d_%H_%M_%S"`.log"
echo $LogFile
cd build/bin/
for ((i = 0 ; i < 3 ; i++)); do
  ./$Program >> $shPATH/log/$LogFile
done
cat $shPATH/log/$LogFile
cat $shPATH/log/$LogFile |awk '$2!="are" {print $2}'|sed 's/^time=//g'|awk '{a+=$1}END{print a/NR}'

# awk找到时间行，sed找出时间数字，awk计算