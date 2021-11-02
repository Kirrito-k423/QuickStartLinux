#!/bin/bash
#SBATCH -o ./log/job_%j_rank%t_%N_%n.out
#SBATCH -p GPU-A100
#SBATCH --qos=normal
#SBATCH -J QuEST
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --exclude=
#SBATCH --cpus-per-task=32
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shaojiemike@mail.ustc.edu.cn

module purge

MPIOPT

computetimes=
taskname=

# sensors
sensors|awk '$3 ~ /[0-2][0-9]/ {print $3}'|sed 's/^+//g'|sed 's/\.0.*//g'
checkTemp=`sensors|awk '$3 ~ /[0-2][0-9]/ {print $3}'|sed 's/^+//g'|wc -l` # 注意这里是不是引号，是波浪线同键位
echo $checkTemp
while [[ "$checkTemp" == "0" ]]; do #判断的时候注意空格
    echo "Temperature is too high!"
    sleep 5
    sensors
    checkTemp=`sensors|awk '$3 ~ /[0-2][0-9]/ {print $3}'|sed 's/^+//g'|wc -l`
done
echo "Temperature is ok!"

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# machine info
lscpu |tee ./out/lscpu.txt
cat /proc/meminfo |tee ./out/mem.txt
lsb_release -d | awk -F"\t" '{print $2}' |tee ./out/archi.txt
cat /proc/version |tee ./out/linuxVersion.txt
ibstat
ibv_devinfo

mpicc ../$taskname.cpp -o $taskname$computetimes
./$taskname$computetimes |tee ../log/$taskname$computetimes.log
