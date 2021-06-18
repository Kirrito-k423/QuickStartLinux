#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define MAX_LINE 50000000
int main(void) {
    //char* get_line = (char*)malloc(MAX_LINE * sizeof(char));
    int vex_num, nparts;

    FILE* fp = fopen("input.txt", "r");
    fscanf(fp, "%d%d", &vex_num, &nparts);
    FILE* fpw = fopen("graphfile.txt", "w+");
    
    
    long long** arch_metrix = (long long**)malloc(vex_num * sizeof(long long*));
    int i;
    for (i = 0; i < vex_num; i++) {
        arch_metrix[i] = (long long*)malloc(vex_num * sizeof(long long));
        memset(arch_metrix[i], 0, vex_num * sizeof(long long));
    }
    long long arch_cnt = 0;
    int row, col;
    //long long check_gt1000000 = 0;
    for (row = 0; row < vex_num; row++) {
        for (col = 0; col < vex_num; col++) {
            fscanf(fp, "%lld", &arch_metrix[row][col]);
            arch_metrix[row][col] /= 1000000;
            if (arch_metrix[row][col] != 0)
                arch_cnt++;
            //if (arch_metrix[row][col] > 1000000)
            //    check_gt1000000++;
        }
    }
    //printf ("%lld %lld\n", arch_cnt, check_gt1000000);
    fprintf(fpw, "%d %lld 001\n", vex_num, arch_cnt);
    for (row = 0; row < vex_num; row++) {
        for (col = 0; col < vex_num; col++) {
            if (arch_metrix[row][col] != 0)
                fprintf(fpw, " %d %lld ", col + 1, arch_metrix[row][col]);
        }
        fprintf(fpw, "\n");
    }
    return 0;
}