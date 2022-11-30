set -o xtrace
source /public1/soft/modules/module.sh
module load gcc/8.1.0
module load mpich/3.1.4-gcc8.1.0
export OMP_PROC_BIND=close;export OMP_PLACES=cores
declare -i repeat_times=5
cwd_dir=`pwd`
project_dir=$cwd_dir/..
if [ ! -d $project_dir/build/bin ];then
    mkdir -p $project_dir/build/bin
fi
if [ ! -d $project_dir/build/obj ];then
    mkdir -p $project_dir/build/obj
fi
if [ ! -d ${release_dir} ];then
    mkdir -p ${release_dir}
fi

rm -rf ${cwd_dir}/logs
rm -rf ${cwd_dir}/result
mkdir -p ${cwd_dir}/result
mkdir -p ${cwd_dir}/logs

# tag_list=`cd ${project_dir} && git tag --list`
summary_file=${cwd_dir}/summary.txt
coord_file_list=(g-3989-158400.mtx g-6997-83688.mtx g-15991-606980.mtx)
ref_file_list=(refer-3989-158400.txt refer-6997-83688.txt refer-15991-606980.txt)

NUM_THREAD_LIST=(16 32 64)
ADJA_THREAD_LIST=(8)
# ADJA_THREAD_LIST=(8 16 24 32 40 48 56 64)
# SORT1_THREAD_LIST=(32)
SORT1_THREAD_LIST=(24)
SORT2_THREAD_LIST=(32)
# SORT2_THREAD_LIST=(8 16 24 32 40 48 56 64)
# SORT3_THREAD_LIST=(8 16 32 64)
SORT3_THREAD_LIST=(32)
# TREE_BFS_THREAD_LIST=(8 16 24 32 40 48 56 64)
TREE_BFS_THREAD_LIST=(8)
first_step_OMP_percentage=(0 0.001 0.0025 0.005 0.0075 0.01 0.0125 0.015 0.02 0.03)

cases=(1)
output_file="${cwd_dir}/logs/find_opt_thread.log"

for num_thread in ${NUM_THREAD_LIST[@]}
do
    for adja_thread in ${ADJA_THREAD_LIST[@]}
    do
        for sort1_thread in ${SORT1_THREAD_LIST[@]}
        do
            for sort2_thread in ${SORT2_THREAD_LIST[@]}
            do
                for sort3_thread in ${SORT3_THREAD_LIST[@]}
                do
                    for bfs_thread in ${TREE_BFS_THREAD_LIST[@]}
                    do
                        for first_step_OMP_percentage_thread in ${first_step_OMP_percentage[@]}
                        do
                            sed -i "s/CREATE_ADJA_THREADS.*/CREATE_ADJA_THREADS ${adja_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/SORT1_THREADS.*/SORT1_THREADS ${sort1_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/SORT2_THREADS.*/SORT2_THREADS ${sort2_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/SORT3_THREADS.*/SORT3_THREADS ${sort3_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/TREE_BFS_THREADS.*/TREE_BFS_THREADS ${bfs_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/first_step_OMP_percentage.*/first_step_OMP_percentage ${first_step_OMP_percentage_thread}/g" ${project_dir}/feGRASS/global.h
                            sed -i "s/NUM_THREADS.*/NUM_THREADS ${num_thread}/g" ${project_dir}/feGRASS/global.h
                            make -C ..
                            for index in ${cases[@]}
                            do
                                input=${cwd_dir}/${coord_file_list[$index]}
                                ref=${cwd_dir}/${ref_file_list[$index]}
                                result=${cwd_dir}/result/result.txt
                                max_thread=${num_thread}
                                if [ $adja_thread -ge $max_thread ]; then
                                    max_thread=$adja_thread
                                fi
                                if [ $sort1_thread -ge $max_thread ]; then
                                    max_thread=$sort1_thread
                                fi
                                if [ $sort2_thread -ge $max_thread ]; then
                                    max_thread=$sort2_thread
                                fi
                                if [ $sort3_thread -ge $max_thread ]; then
                                    max_thread=$sort3_thread
                                fi
                                if [ $bfs_thread -ge $max_thread ]; then
                                    max_thread=$bfs_thread
                                fi
                                echo "Start to Run Case ${input} Using ${max_thread} threads......"
                                # stdbuf --output=L srun -p IPCC -N 1 -c 32 -t 2 ${release_dir}/main${tag} ${input} 2>&1 | tee -a $output_file
                                # stdbuf --output=L ${release_dir}/main${tag} ${input} 2>&1 |  tee -a $output_file
                                # time=`stdbuf --output=L ${release_dir}/main${tag} ${input} 2>&1 | grep 'Using time' | awk '{print $4}'`
                                total=0.0
                                for((i=1;i<=${repeat_times};i++));
                                do
                                    time=`stdbuf --output=L srun -p IPCC -N 1 -n 1 -c ${max_thread}  -t 10 ${project_dir}/build/bin/main ${input} 2>&1 | grep 'Using time' | awk '{print $4}'`
                                    # echo "Tag: ${tag}, Case: ${index}, Repeat Count: ${i},  Using Time: ${time} ms" | tee -a $summary_file
                                    # echo "Start to Check Result of ${coord_file_list[$index]} by ${ref_file_list[$index]}......" | tee -a $output_file
                                    mv result.txt ${result}
                                    python3 ${cwd_dir}/check.py ${result} ${ref} 2>&1 | tee -a $output_file
                                    total=`echo "$total+$time" | bc -l`
                                    echo "total: $total"
                                done
                                avg=`echo "${total}/${repeat_times}" | bc -l`
                                echo "Case: ${index}, num_thread: ${num_thread}, Adja: ${adja_thread}, Sort1: ${sort1_thread}, Sort2: ${sort2_thread}, Sort3: ${sort3_thread}, BFS: ${bfs_thread}, first_pert: ${first_step_OMP_percentage_thread} , avg Time: ${avg} ms" | tee -a $summary_file
                                echo "Start to Check Result of ${coord_file_list[$index]} by ${ref_file_list[$index]}......" | tee -a $output_file
                            done
                            echo " \n" |tee -a $summary_file
                        done
                    done
                done
            done
        done
    done
done
