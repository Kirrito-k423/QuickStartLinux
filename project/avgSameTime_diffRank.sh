
#!/bin/bash
###
 # @Descripttion: 
 # @version: 
 # @Author: Shaojie Tan
 # @Date: 2021-12-18 20:15:42
 # @LastEditors: Shaojie Tan
 # @LastEditTime: 2021-12-27 20:18:30
### 
# TaskName="BinaryTreesMPI"

TaskName="ButterflySumMPI"
# MPIrank=('1','2','4','8','16','32')
# for i in "${MPIrank[@]}"; do
# source /opt/intel/oneapi/setvars.sh
avgNum=10
rm -f MPI.log
rm -f MPI2.logInLine
for i in {0..5}; do
	rank=$((2**$i))
# for rank in {1..32}; do
	# omp_num=$((32/$rank))
	# omp_num=1
	omp_num=$rank
	echo $rank $omp_num
	export OMP_NUM_THREADS=$omp_num
	rm -f MPISumTmp.log
	for ((j = 0 ; j < $avgNum ; j++)); do
		mpirun -np $rank ./build/$TaskName |awk '$2=="Sum" {print $9}'|awk '{a+=$1}END{print a/NR}' >> MPISumTmp.log
	done
	cat MPISumTmp.log|awk '{a+=$1}END{print a/NR}' >> MPI.log
	echo -n "`cat MPISumTmp.log|awk '{a+=$1}END{print a/NR}'`, " >> MPI2.logInLine
	# ./build/$TaskName $rank |awk '$1=="time:" {print $2}' >> MPI.log
	# echo $rank >> MPI.log
done
paste -sd ',' MPI.log > MPI.logInLine

