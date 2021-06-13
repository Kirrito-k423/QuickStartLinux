 #!/bin/bash

 numtiles_x=1
 nproc=160

 for numtiles_y in {4,6,8,10,12,14,16,18,20,22,24,26,28}; do
     for nproc_x in {2,4,5,8,10}; do

     nproc_y=`python -c "print 160/${nproc_x}"`

     echo ${numtiles_x} ${numtiles_y} ${nproc_x} ${nproc_y}

         cat namelistin.txt | sed "s/txxxxx/${numtiles_x}/" | sed "s/tyyyyy/${numtiles_y}/" | sed "s/cxxxxx/${nproc_x}/" | sed "s/cyyyyy/${nproc_y}/" >               namelist_${numtiles_x}_${numtiles_y}_${nproc_x}_${nproc_y}.input

     cp namelist_${numtiles_x}_${numtiles_y}_${nproc_x}_${nproc_y}.input namelist.input

         while (( 1 ))
     do
         squeue -u `whoami` | grep "ella717"

         if [ $? -ne 0 ]; then
                 echo "haven't found, have completed run"
         break
         fi
     sleep 20
     done

     cat WRF_rsl_cp.sh | sed "s/tyyyyy/${numtiles_y}/" | sed "s/cxxxxx/${nproc_x}/" | sed "s/cyyyyy/${nproc_y}/" > WRF_rsl_cp1.sh
     sh WRF_rsl_cp1.sh
     mv namelist_${numtiles_x}_${numtiles_y}_${nproc_x}_${nproc_y}.input 6.13-intelmpi-1-${numtiles_y}-${nproc_x}-${nproc_y}-precise

     sbatch RUN.slurm

     done
 done