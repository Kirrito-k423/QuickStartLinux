#!/bin/bash
#SBATCH -N 4
#SBATCH --ntasks-per-node=40
#SBATCH --cpus-per-task=1
#SBATCH -J hostname
#SBATCH -t 40:00
#SBATCH --exclusive
#SBATCH -d singleton
#SBATCH -o hostname-%j.out

module load NiaEnv/2019b
module load intel/2019u4  openmpi/4.0.1

export OMP_NUM_THREADS=1

scontrol show hostnames $SLURM_JOB_NODELIST > hostname1.txt
sh change_hostname.sh
mpirun --hostfile hostname1.txt -rf rankfile.txt -np 160 ./HelloWorld > rsl.txt
