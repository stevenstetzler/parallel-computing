#include <stdio.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

const unsigned int N_TRIALS = 10;

// If the specified error code refers to a real error, report it and quit the program
void check_error(cudaError e) { 
    //printf("%s\n", cudaGetErrorString(e));
    if (e != cudaSuccess) {
        printf("\nCUDA error: %s\n", cudaGetErrorString(e));
        exit(1);
    }
}

__global__ void matrix_mult_gpu(float* A, float* B, float* C, int N)
{
    //printf("Hi Cuda World\n");
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    // printf("row = %d, col = %d\n", row, col);
    // printf("A[0] = %d, B[0] = %d\n", A[0], B[0]);
    
    int k, idx;
    float sum;   
 
    if (row < N && col < N) {
        idx = row * N + col;
        sum = 0;
        for (k = 0; k < N; k++) {
            //if (row == 99 && col == 39) {
            //    printf("k = %d\tA = %f\tB = %f\n", k, A[row * N + k], B[k * N + col]);
            //}
            sum += A[row * N + k] * B[k * N + col];
        }
        //printf("row = %d, col = %d, sum = %f\n", row, col, sum);
        C[idx] = sum;
        //if (row == 99 && col == 39) {
        //    printf("sum = %f\n", sum);
        //}
    } 
}

void matrix_mult_cpu(float* A, float* B, float* C, int N) 
{
    int row, col, k, idx;
    float sum;

    for (row = 0; row < N; row++) {
        for (col = 0; col < N; col++) {
            idx = row * N + col;
            sum = 0;
            for (k = 0; k < N; k++) {
                //if (row == 99 && col == 39) {
                //    printf("k = %d\tA = %f\tB = %f\n", k, A[row * N + k], B[k * N + col]);
                //}
                sum += A[row * N + k] * B[k * N + col];
            }
            //printf("row = %d, col = %d, sum = %f\n", row, col, sum);
            C[idx] = sum;
            //if (row == 99 && col == 39) {
            //    printf("sum = %f\n", sum);
            //}
        }
    }
}

void compareHostAndGpuOutput(float* C, float* C_CPU, int N) {
    int totalElements = N * N;
    int missmatchCount = 0;
    for (int i = 0; i < totalElements; i++) {
        // printf("%d\n",i);
        if (fabs(C[i] - C_CPU[i]) > 0.01) {
            missmatchCount++;
            printf("mismatch at index %i: %f\t%f\n", i, C[i], C_CPU[i]);
        }
    }
    if (missmatchCount > 0) {
        printf("Computation is incorrect: outputs do not match in %d indexes\n", missmatchCount);
    } else {
        printf("Computation is correct: CPU and GPU outputs match\n");
    }
}


int main( int argc, char** argv )
{
    int N = (argc > 1) ? atoi(argv[1]) : 100;
    int check_cpu = (argc > 2) ? atoi(argv[2]) : 0;

    printf("N = %d\nGrid: %d x %d\nThreads: %d x %d\n", N, (int) ceil((double) N / 32), (int) ceil((double) N / 32), 32, 32);

    dim3 block_per_grid((int) ceil((double) N / 32), (int) ceil((double) N / 32) , 1);
    dim3 thread_per_block(32, 32, 1);
    
    float* A = (float*) malloc(N * N * sizeof(float));
    float* B = (float*) malloc(N * N * sizeof(float));
    float* C = (float*) malloc(N * N * sizeof(float));

    int i, j;
    float val;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            val = (rand() % 1000) * 0.001;
            A[i * N + j] = val;
            B[i * N + j] = val;
            C[i * N + j] = val;
            //printf("%f\t", A[i * N + j]);
        }
        //printf("\n");
    }

    float* A_GPU; // = (int*) malloc(N * N * sizeof(int));
    float* B_GPU; // = (int*) malloc(N * N * sizeof(int));
    float* C_GPU;

    clock_t start, end;
    double elapsed;

    if (check_cpu) {
        start = clock();
        matrix_mult_cpu(A, B, C, N);
        end = clock();
        
        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        printf("CPU: %.10f seconds\n", elapsed);
    }

    double copy_avg_time = 0;
    double comp_avg_time = 0;

    for (i = 0 ; i < N_TRIALS; i++) {
        start = clock();

        check_error(cudaMalloc((void **) &A_GPU, N * N * sizeof(float)));
        check_error(cudaMalloc((void **) &B_GPU, N * N * sizeof(float)));
        check_error(cudaMalloc((void **) &C_GPU, N * N * sizeof(float)));
        check_error(cudaMemcpy(A_GPU, A, N * N * sizeof(float), cudaMemcpyHostToDevice));
        check_error(cudaMemcpy(B_GPU, B, N * N * sizeof(float), cudaMemcpyHostToDevice));
        check_error(cudaMemcpy(C_GPU, C, N * N * sizeof(float), cudaMemcpyHostToDevice));

        end = clock();

        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        copy_avg_time += elapsed; 
        //printf("GPU_copy: %.10f seconds\n", elapsed);
        
        start = clock();
        
        matrix_mult_gpu<<<block_per_grid, thread_per_block>>>(A_GPU, B_GPU, C_GPU, N);
        cudaDeviceSynchronize();
        
        end = clock();

        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        comp_avg_time += elapsed; 
        
        //printf("GPU: %.10f seconds\n", elapsed);

        if (i != N_TRIALS - 1) {
            check_error(cudaFree(A_GPU));
            check_error(cudaFree(B_GPU));
            check_error(cudaFree(C_GPU));
        }
    }
    
    printf("GPU_copy: %.10f seconds\n", copy_avg_time / N_TRIALS);
    printf("GPU: %.10f seconds\n", comp_avg_time / N_TRIALS);

    if (check_cpu) {
        float* C_GPU_Copy = (float*) malloc(N * N * sizeof(float));

        check_error(cudaMemcpy(C_GPU_Copy, C_GPU, N * N * sizeof(float), cudaMemcpyDeviceToHost));
        compareHostAndGpuOutput(C, C_GPU_Copy, N);
    }

    return 0;
}

