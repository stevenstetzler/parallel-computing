/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Bad coding example 1
! !
! Shamefully written by Ross Walker (SDSC, 2006)
!
! This code reads a series of coordinates and charges from the file
! specified as argument $1 on the command line.
!
! This file should have the format:
!  I9
! 4F10.4   (repeated I9 times representing x,y,z,q)
!
! It then calculates the following fictional function:
!
!             exp(rij*qi)*exp(rij*qj)   1
!    E = Sum( ----------------------- - - )  (rij <= cut)
!        j<i           r(ij)            a
!
! where cut is a cut off value specified on the command line ($2),
! r(ij) is a function of the coordinates read in for each atom and
! a is a constant.
!
! The code prints out the number of atoms, the cut off, total number of
! atom pairs which were less than or equal to the distance cutoff, the
! value of E, the time take to generate the coordinates and the time
! taken to perform the calculation of E.
!
! All calculations are done in double precision.
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "kdtree.h"
#include <string.h>

double **alloc_2D_double(int nrows, int ncolumns);
void double_2D_array_free(double **array);
/* Functions to test */
double original(double** coords, double* q, int natom, double cut);
double no_pow(double** coords, double* q, int natom, double cut);
double all_opts_and_check_dist(double** coords, double* q, int natom, double cut);
double kd_tree_sort(double** coords, double* q, int natom, double cut);
double check_distance(double** coords, double* q, int natom, double cut);
double all_opts_unroll_out_4(double** coords, double* q, int natom, double cut);
double all_opts(double** coords, double* q, int natom, double cut);
double necessary_rij(double** coords, double* q, int natom, double cut);
double pull_out_a(double** coords, double* q, int natom, double cut);
double multiple_accumulators(double** coords, double* q, int natom, double cut);
double no_add_index(double** coords, double* q, int natom, double cut);
double no_if(double** coords, double* q, int natom, double cut);
double combine_exp_combine_mult(double** coords, double* q, int natom, double cut);
double combine_exp(double** coords, double* q, int natom, double cut);
/* Testing function */
void test_func(double (*func_prt)(double**, double*, int, double), char* func_name, int argc, char* argv[]);
/* Original functionality */
void original_run(int argc, char* argv[]);

double TARGET_E;
double TARGET_CUT;

int main(int argc, char *argv[])
{
    original_run(argc, argv);
    test_func(&no_pow, "no_pow", argc, argv);
    test_func(&check_distance, "check_distance", argc, argv);
    test_func(&necessary_rij, "necessary_rij", argc, argv);
    test_func(&pull_out_a, "pull_out_a", argc, argv);
    test_func(&multiple_accumulators, "multiple_accumulators", argc, argv);
    test_func(&no_add_index, "no_add_index", argc, argv);
    test_func(&no_if, "no_if", argc, argv);
    test_func(&combine_exp_combine_mult, "combine_exp_combine_mult", argc, argv);
    test_func(&combine_exp, "combine_exp", argc, argv);
    test_func(&all_opts, "all_opts", argc, argv);
    test_func(&all_opts_and_check_dist, "all_opts_and_check_dist", argc, argv);
    test_func(&kd_tree_sort, "kd_tree_sort", argc, argv);
    exit(0);
}

double all_opts_and_check_dist(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;
    double x, y, z;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;

    for (i = 0; i < natom; ++i)
    {
        for (j = 0; j < i; ++j)
        {
            x = coords[0][i] - coords[0][j];
            if (x >= cut)
            {
                continue;
            }
            y = coords[1][i] - coords[1][j];
            if (y >= cut)
            {
                continue;
            }
            z = coords[2][i] - coords[2][j];
            if (z >= cut)
            {
                continue;
            }
            
            rij = sqrt(x*x + y*y + z*z);

            if ( rij <= cut )
            {
                ++cut_count;
                current_e = (exp(rij * (q[i] + q[j])))/rij;
                total_e = total_e + current_e;
            }
        }
    }

    total_e = total_e - cut_count / a;

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double kd_tree_sort(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    void* kd = kd_create(3);
    double data[natom][4];
    double new_pt[natom][3];

    for (i = 0; i < natom; ++i)
    {
        new_pt[i][0] = coords[0][i];
        new_pt[i][1] = coords[1][i];
        new_pt[i][2] = coords[2][i];
        data[i][0] = new_pt[i][0];
        data[i][1] = new_pt[i][1];
        data[i][2] = new_pt[i][2];
        data[i][3] = (double) i;
        kd_insert(kd, new_pt[i], data[i]);
    }

    total_e = 0.0;
    cut_count = 0;

    void* result_set;
    double* near_pt_data;

    char* flags = (char*) malloc(natom * natom * sizeof(char)); 
    memset(flags, 0, natom * natom * sizeof(flags[0]));

    double pt[3];

    for (i = 0; i < natom; ++i)
    {
        pt[0] = coords[0][i];
        pt[1] = coords[1][i];
        pt[2] = coords[2][i];
        result_set = kd_nearest_range(kd, pt, cut);

        // Loop through, ignoring the first closest (self)
        do {
            near_pt_data = (double*) kd_res_item_data(result_set);
            j = (int) near_pt_data[3];
            if (i == j) {
                continue;
            }
            if (flags[i * natom + j] == 0) {
                flags[i * natom + j] = 1;
                flags[j * natom + i] = 1;

                // printf("Comparing %d and %d\n", i, j);
                vec2 = pow(pt[0] - near_pt_data[0], 2.0)
                    + pow(pt[1] - near_pt_data[1], 2.0)
                    + pow(pt[2] - near_pt_data[2], 2.0);
                rij = sqrt(vec2);

                ++cut_count;
                current_e = (exp(rij * q[i]) * exp(rij * q[j]))/rij;
                total_e = total_e + current_e - 1.0/a;
           }
        } while(kd_res_next(result_set));
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    free(flags);
    kd_free(kd);

    return (double) (time2 - time1);
}

double check_distance(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;
    double x;
    double y;
    double z;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                x = coords[0][i-1] - coords[0][j-1];
                if (x > cut) {
                    continue;
                }
                y = coords[1][i-1] - coords[1][j-1];
                if (y > cut) {
                    continue;
                }
                z = coords[2][i-1] - coords[2][j-1];
                if (z > cut) {
                    continue;
                }
                
                vec2 = pow(x, 2.0) + pow(y, 2.0) + pow(z, 2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double no_pow(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij, x, y, z;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                x = coords[0][i-1] - coords[0][j-1];
                y = coords[1][i-1] - coords[1][j-1];
                z = coords[2][i-1] - coords[2][j-1];

                vec2 = x*x + y*y + z*z;
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}


double all_opts(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;
    double x, y, z;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;

    for (i = 0; i < natom; ++i)
    {
        for (j = 0; j < i; ++j)
        {
            x = coords[0][i] - coords[0][j];
            y = coords[1][i] - coords[1][j];
            z = coords[2][i] - coords[2][j];

            rij = sqrt(x*x + y*y + z*z);

            if ( rij <= cut )
            {
                ++cut_count;
                current_e = (exp(rij * (q[i] + q[j])))/rij;
                total_e = total_e + current_e;
            }
        }
    }

    total_e = total_e - cut_count / a;

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double necessary_rij(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;
    double cut2;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    cut2 = cut * cut;

    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                       + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                       + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                if ( vec2 <= cut2 )
                {
                    rij = sqrt(vec2);
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double pull_out_a(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                       + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                       + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e;
                }
            }
        }
    }

    total_e = total_e - (double) cut_count / a;

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}


double multiple_accumulators(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;
    double x2, y2, z2;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                x2 = pow((coords[0][i-1]-coords[0][j-1]),2.0);
                y2 = pow((coords[1][i-1]-coords[1][j-1]),2.0);
                z2 = pow((coords[2][i-1]-coords[2][j-1]),2.0);
                rij = sqrt(x2 + y2 + z2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double no_add_index(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i = 0; i < natom; ++i)
    {
        for (j = 0; j <= natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i] - coords[0][j]), 2.0)
                       + pow((coords[1][i] - coords[1][j]), 2.0)
                       + pow((coords[2][i] - coords[2][j]), 2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij * q[i]) * exp(rij * q[j]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double no_if(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i = 1; i <= natom; ++i)
    {
        for (j = 1; j < i; ++j)
        {
            vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                   + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                   + pow((coords[2][i-1]-coords[2][j-1]),2.0);
            rij = sqrt(vec2);
            if ( rij <= cut )
            {
                ++cut_count;
                current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                total_e = total_e + current_e - 1.0/a;
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double combine_exp_combine_mult(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                       + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                       + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij * (q[i-1] + q[j-1])))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double combine_exp(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                       + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                       + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1] + rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

double original(double** coords, double* q, int natom, double cut)
{
    clock_t time1, time2;

    double total_e, current_e, vec2, rij;
    double a;
    int cut_count;
    int i, j;

    a = 3.2;

    time1 = clock();

    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                       + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                       + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                rij = sqrt(vec2);
                if ( rij <= cut )
                {
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            }
        }
    }

    time2 = clock();

    if (fabs(total_e - TARGET_E) > 0.0001)
    {
        printf("Bad E! Got %14.10f\n", total_e);
    }

    if (cut_count != TARGET_CUT)
    {
        printf("Incorrect number of pairs! Got %d\n", cut_count);
    }

    return (double) (time2 - time1);
}

void test_func(double (*func_prt)(double**, double*, int, double), char* func_name, int argc, char* argv[])
{
    int n_test = 5;
    printf("\n\tTesting function %s\n", func_name);
    double avg_time = 0;
    int i;
    double test_time = 0;

    // NEW
    long natom;
    long cut_count;

    /* Timer variables */
    clock_t time0;

    double cut;     /* Cut off for Rij in distance units */
    double **coords;
    double *q;
    FILE *fptr;
    char *cptr;
    int fstatus;
    
    time0 = clock(); /*Start Time*/

    /* Step 1 - obtain the filename of the coord file and the value of
       cut from the command line.
                Argument 1 should be the filename of the coord file (char).
                Argument 2 should be the cut off (float). */
    /* Quit therefore if iarg does not equal 3 = executable name,
       filename, cut off */
    if (argc != 3)
    {
        printf("ERROR: only %d command line options detected", argc-1);
        printf (" - need 2 options, filename and cutoff.\n");
        exit(1);
    }
    printf("\nCoordinates will be read from file: %s\n",argv[1]);

    /* Step 2 - Open the coordinate file and read the first line to
       obtain the number of atoms */
    if ((fptr=fopen(argv[1],"r"))==NULL)
    {
        printf("ERROR: Could not open file called %s\n",argv[1]);
        exit(1);
    }
    else
    {
        fstatus = fscanf(fptr, "%ld", &natom);
    }

    printf("Natom = %ld\n", natom);

    cut = strtod(argv[2],&cptr);
    printf("cut = %10.4f\n\n", cut);

    /* Step 3 - Allocate the arrays to store the coordinate and charge
       data */
    coords=alloc_2D_double(3,natom);
    if ( coords==NULL )
    {
        printf("Allocation error coords");
        exit(1);
    }
    q=(double *)malloc(natom*sizeof(double));
    if ( q == NULL )
    {
        printf("Allocation error q");
        exit(1);
    }

    /* Step 4 - read the coordinates and charges. */
    for (i = 0; i<natom; ++i)
    {
        fstatus = fscanf(fptr, "%lf %lf %lf %lf",&coords[0][i],
               &coords[1][i],&coords[2][i],&q[i]);
    }

    for (i = 0; i < n_test; i++) {

        test_time = (*func_prt)(coords, q, natom, cut);
        printf("Test %d: %f\n", i, test_time / (double) CLOCKS_PER_SEC);
        avg_time += test_time;

    }

    free(q);
    double_2D_array_free(coords);

    fclose(fptr);

    avg_time /= n_test;
    avg_time /= (double) CLOCKS_PER_SEC;
    printf("Average Time = %f\n", avg_time);
}

void original_run(int argc, char* argv[])
{
    long natom, i, j;
    long cut_count;

    /* Timer variables */
    clock_t time0, time1, time2;

    double cut;     /* Cut off for Rij in distance units */
    double **coords;
    double *q;
    double total_e, current_e, vec2, rij;
    double a;
    FILE *fptr;
    char *cptr;
    int fstatus;

    a = 3.2;

    time0 = clock(); /*Start Time*/
    printf("Value of system clock at start = %ld\n",time0);

    /* Step 1 - obtain the filename of the coord file and the value of
    *        cut from the command line.
    *                        Argument 1 should be the filename of the coord file (char).
    *                        Argument 2 should be the cut off (float). */
    /* Quit therefore if iarg does not equal 3 = executable name,
    *        filename, cut off */
    if (argc != 3)
    {
        printf("ERROR: only %d command line options detected", argc-1);
        printf (" - need 2 options, filename and cutoff.\n");
        exit(1);
    }
    printf("Coordinates will be read from file: %s\n",argv[1]);

    /* Step 2 - Open the coordinate file and read the first line to
    *        obtain the number of atoms */
    if ((fptr=fopen(argv[1],"r"))==NULL)
    {
        printf("ERROR: Could not open file called %s\n",argv[1]);
        exit(1);
    }
    else
    {
        fstatus = fscanf(fptr, "%ld", &natom);
    }

    printf("Natom = %ld\n", natom);

    cut = strtod(argv[2],&cptr);
    printf("cut = %10.4f\n", cut);

    /* Step 3 - Allocate the arrays to store the coordinate and charge
    *        data */
    coords=alloc_2D_double(3,natom);
    if ( coords==NULL )
    {
        printf("Allocation error coords");
        exit(1);
    }
    q=(double *)malloc(natom*sizeof(double));
    if ( q == NULL )
    {
        printf("Allocation error q");
        exit(1);
    }

    /* Step 4 - read the coordinates and charges. */
    for (i = 0; i<natom; ++i)
    {
        fstatus = fscanf(fptr, "%lf %lf %lf %lf",&coords[0][i],
            &coords[1][i],&coords[2][i],&q[i]);
    }

    time1 = clock(); /*time after file read*/
    printf("Value of system clock after coord read = %ld\n",time1);


    /* Step 5 - calculate the number of pairs and E. - this is the
    *        majority of the work. */
    total_e = 0.0;
    cut_count = 0;
    for (i=1; i<=natom; ++i)
    {
        for (j=1; j<=natom; ++j)
        {
            if ( j < i )   /* Avoid double counting. */
            {
                vec2 = pow((coords[0][i-1]-coords[0][j-1]),2.0)
                + pow((coords[1][i-1]-coords[1][j-1]),2.0)
                + pow((coords[2][i-1]-coords[2][j-1]),2.0);
                /* X^2 + Y^2 + Z^2 */
                rij = sqrt(vec2);
                /* Check if this is below the cut off */
                if ( rij <= cut )
                {
                    /* Increment the counter of pairs below cutoff */
                    ++cut_count;
                    current_e = (exp(rij*q[i-1])*exp(rij*q[j-1]))/rij;
                    total_e = total_e + current_e - 1.0/a;
                }
            } /* if (j<i) */
        } /* for j=1 j<=natom */
    } /* for i=1 i<=natom */

    time2 = clock(); /* time after reading of file and calculation */
    printf("Value of system clock after coord read and E calc = %ld\n",
        time2);

    /* Step 6 - write out the results */
    printf("                         Final Results\n");
    printf("                         -------------\n");
    printf("                   Num Pairs = %ld\n",cut_count);
    printf("                     Total E = %14.10f\n",total_e);
    printf("     Time to read coord file = %14.4f Seconds\n",
        ((double )(time1-time0))/(double )CLOCKS_PER_SEC);
    printf("         Time to calculate E = %14.4f Seconds\n",
        ((double )(time2-time1))/(double )CLOCKS_PER_SEC);
    printf("        Total Execution Time = %14.4f Seconds\n",
        ((double )(time2-time0))/(double )CLOCKS_PER_SEC);

    /* Step 7 - Deallocate the arrays - we should strictly check the
    *        return values here but for the purposes of this tutorial we can
    *               ignore this. */
    free(q);
    double_2D_array_free(coords);

    fclose(fptr);

    TARGET_E = total_e;
    TARGET_CUT = cut_count;
}

double **alloc_2D_double(int nrows, int ncolumns)
{
    /* Allocates a 2d_double_array consisting of a series of pointers
       pointing to each row that are then allocated to be ncolumns
       long each. */

    /* Try's to keep contents contiguous - thus reallocation is
       difficult! */

    /* Returns the pointer **array. Returns NULL on error */
    int i;

    double **array = (double **)malloc(nrows*sizeof(double *));
    if (array==NULL)
        return NULL;
    array[0] = (double *)malloc(nrows*ncolumns*sizeof(double));
    if (array[0]==NULL)
        return NULL;

    for (i = 1; i < nrows; ++i)
        array[i] = array[0] + i * ncolumns;

    return array;

}

void double_2D_array_free(double **array)
{
    /* Frees the memory previously allocated by alloc_2D_double */
    free(array[0]);
    free(array);
}
