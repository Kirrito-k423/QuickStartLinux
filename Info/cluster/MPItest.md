# MPI test

```c
#include <stdio.h> 
#include "mpi.h"
#include <stdlib.h>

int main(int argc, char *argv[]){

    int rank,size;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank); /*当前进程在MPI_COMM_WORLD这个通信组下面 编号是多少*/
    MPI_Comm_size(MPI_COMM_WORLD, &size); /*MPI_COMM_WORLD这个通信组下面 有多少个进程*/ 
    printf("rank=%d, size=%d\n",rank,size);
    MPI_Finalize();
}

```
```
mpiicc/mpicc mpi.c 
mpiexec -n 32 ./a.out
```