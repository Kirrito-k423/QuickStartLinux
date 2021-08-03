#!/bin/bash
#SBATCH -o ./log/job_%j_rank%t_%N_%n.out
#SBATCH -p GPU-A100
#SBATCH --qos=normal
#SBATCH -J QuEST
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shaojiemike@mail.ustc.edu.cn

lscpu > ./out/lscpu.txt
cat /proc/meminfo > ./out/mem.txt
lsb_release -d | awk -F"\t" '{print $2}' > ./out/archi.txt
cat /proc/version > ./out/linuxVersion.txt
