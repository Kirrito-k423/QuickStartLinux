#!/bin/bash


for x in {176..180..4}; do
	for y in {176..180..4}; do
		for z in {184..204..4}; do
		cd /scratch/users/industry/isc2020/iscst11/ella717/tsj-hpcg
		# replace the template "txxxxxx" to generate input file
		echo ${x} ${y} ${z} >> auto.log
		cd /scratch/users/industry/isc2020/iscst11/ella717/hpcg/build/bin
		cat hpcg.dat_bk | sed "s/xxx/${x}/" | sed "s/yyy/${y}/" | sed "s/zzz/${z}/">hpcg.dat

		cd /scratch/users/industry/isc2020/iscst11/ella717/tsj-hpcg
		qsub tsjhpcg.sh
		while (( 1 ))
		do
			echo ${x} ${y} ${z} 
			qstat -a | grep "tsjhpcx"
			if [ $? -ne 0 ]; then
				echo "haven't found, have completed run"
				break
			fi
			sleep 20
		done

		cd /scratch/users/industry/isc2020/iscst11/ella717/tsj-hpcg
		# move output/input to a new directory
		mv HPCG-Benchmark_3.1_* tsj-hpcg-output/'HPCG-Benchmark_3.1_'${x}'_'${y}'_'${z}''
		cd /scratch/users/industry/isc2020/iscst11/ella717/hpcg/build/bin
		mv HPCG-Benchmark_3.1_* tsj-hpcg-output/'HPCG-Benchmark_3.1_'${x}'_'${y}'_'${z}''
		done
	done
done