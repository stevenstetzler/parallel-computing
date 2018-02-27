#include "kdtree.h"
#include "stdio.h"
#include <string.h>

int main(int argc, char *argv[]) {
    void* kd = kd_create(3);
    double pt_1[3], pt_2[3], pt_3[3];
    pt_1[0] = 0;
    pt_1[1] = 0;
    pt_1[2] = 0;
 
    pt_2[0] = 1;
    pt_2[1] = 1;
    pt_2[2] = 1;

    pt_3[0] = 0.5;
    pt_3[1] = 0.5;
    pt_3[2] = 0.5;

    kd_insert(kd, pt_1, pt_1);
    kd_insert(kd, pt_2, pt_2);
    kd_insert(kd, pt_3, pt_3);

    void* result_set;

    double pt[] = {0.5, 0.5, 0.5};

    result_set = kd_nearest_range(kd, pt, 3);

    printf("%d\n", kd_res_size(result_set));
    double* data = (double*) kd_res_item_data(result_set);
//    printf("%f %f %f\n", data[0], data[1], data[2]);
    while(kd_res_next(result_set)) {
        data = (double*) kd_res_item_data(result_set);
        printf("%f %f %f\n", data[0], data[1], data[2]);
    }

    char* cptr;
    int n = (int) strtod(argv[1], &cptr);
    printf("%d\n", n);
    char flags[n][n];
    //memset(flags, 0, sizeof flags);
    printf("%d\n", flags[n/2][n/2]);
}
