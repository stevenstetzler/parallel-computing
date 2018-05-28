/*
 * CS 4444
 * Steven Stetzler
 * Homework 5: Matrix-Matrix Multiplication with CUDA
 */

#include <stdio.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

// If the specified error code refers to a real error, report it and quit the program
void check_error(cudaError e) { 
    if (e != cudaSuccess) {
        printf("\nCUDA error: %s\n", cudaGetErrorString(e));
        exit(1);
    }
}

// A GPU implementation of matrix multiplication.
// Given three N x N matrices A, B, and C we compute C = A x B
__global__ void matrix_mult_gpu(float* A, float* B, float* C, int N) {
    // Get the row and column of C that this thread should work on
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    int k, idx;
    float sum;   
    
    // Ignore threads that would compute values outside of the boundary of the matrix
    if (row < N && col < N) {
        idx = row * N + col;
        sum = 0;
        for (k = 0; k < N; k++) {
            sum += A[row * N + k] * B[k * N + col];
        }
        C[idx] = sum;
    } 
}

// A naive (no cache blocking) CPU implementation of matrix multiplication
// Given three N x N matrices A, B, and C we compute C = A x B
void matrix_mult_cpu(float* A, float* B, float* C, int N) {
    int row, col, k, idx;
    float sum;

    for (row = 0; row < N; row++) {
        for (col = 0; col < N; col++) {
            idx = row * N + col;
            sum = 0;
            for (k = 0; k < N; k++) {
                sum += A[row * N + k] * B[k * N + col];
            }
            C[idx] = sum;
        }
    }
}

// Compare the values in two N x N matrices C and C_CPU
void compareHostAndGpuOutput(float* C, float* C_CPU, int N) {
    int totalElements = N * N;
    int missmatchCount = 0;
    for (int i = 0; i < totalElements; i++) {
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

// Main method
int main(int argc, char** argv) {
    // The problem size N is the dimension of the arrays
    int N = (argc > 1) ? atoi(argv[1]) : 100;
    // Option whether or not to check GPU output against CPU implementation
    // Should not be included for large N, as CPU will be very slow
    int check_cpu = (argc > 2) ? atoi(argv[2]) : 0;
    // Options to specify the thread gridding
    int thread_x = (argc > 3) ? atoi(argv[3]) : 32;
    int thread_y = (argc > 4) ? atoi(argv[4]) : 32;
    // Option to specify the number of trials for run time tests of the GPU
    int n_trials = (argc > 5) ? atoi(argv[5]) : 10;

    // Compute block gridding from the thread gridding
    // This is the minimum size block gridding given the size of the array and the thread gridding that guarantees that all values
    // in C will be computed
    int grid_x = (int) ceil((double) N / thread_x);
    int grid_y = (int) ceil((double) N / thread_y);

    // Print run parameters
    printf("N = %d\nGrid: %d x %d\nThreads: %d x %d\nTrials: %d\n", N, grid_x, grid_y, thread_x, thread_y, n_trials);

    // Specify block and thread gridding
    dim3 block_per_grid(grid_x, grid_y , 1);
    dim3 thread_per_block(thread_x, thread_y, 1);
    
    // Create and allocate three arrays
    float* A = (float*) malloc(N * N * sizeof(float));
    float* B = (float*) malloc(N * N * sizeof(float));
    float* C = (float*) malloc(N * N * sizeof(float));
    
    // Create pointers for GPU arrays, but do not allocate yet!
    float* A_GPU;
    float* B_GPU;
    float* C_GPU;

    // Perform random initialization of the arrays
    int i, j;
    float val;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            val = (rand() % 1000) * 0.001;
            A[i * N + j] = val;
            B[i * N + j] = val;
            C[i * N + j] = val;
        }
    }

    clock_t start, end;
    double elapsed;

    // If we want to check against CPU, perform CPU matrix multiplication and time it
    if (check_cpu) {
        start = clock();
        matrix_mult_cpu(A, B, C, N);
        end = clock();
        
        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        printf("CPU: %.10f seconds\n", elapsed);
    }

    double copy_avg_time = 0;
    double comp_avg_time = 0;

    // For each trial in run time analysis
    for (i = 0 ; i < n_trials; i++) {
        // Time the copy operation
        start = clock();

        // Allocate arrays on GPU
        check_error(cudaMalloc((void **) &A_GPU, N * N * sizeof(float)));
        check_error(cudaMalloc((void **) &B_GPU, N * N * sizeof(float)));
        check_error(cudaMalloc((void **) &C_GPU, N * N * sizeof(float)));
        // Copy in values from A, B, and C
        check_error(cudaMemcpy(A_GPU, A, N * N * sizeof(float), cudaMemcpyHostToDevice));
        check_error(cudaMemcpy(B_GPU, B, N * N * sizeof(float), cudaMemcpyHostToDevice));
        check_error(cudaMemcpy(C_GPU, C, N * N * sizeof(float), cudaMemcpyHostToDevice));

        end = clock();

        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        copy_avg_time += elapsed; 
       
        // Time the computation operation 
        start = clock();
        
        // Perform GPU matrix multiply
        matrix_mult_gpu<<<block_per_grid, thread_per_block>>>(A_GPU, B_GPU, C_GPU, N);
        cudaDeviceSynchronize();
        
        end = clock();

        elapsed = (end - start) / (double) CLOCKS_PER_SEC;
        comp_avg_time += elapsed; 
        
        // Free arrays if this isn't our last trial
        if (i != n_trials - 1) {
            check_error(cudaFree(A_GPU));
            check_error(cudaFree(B_GPU));
            check_error(cudaFree(C_GPU));
        }
    }

    // Print timing results    
    printf("GPU_copy: %.10f seconds\n", copy_avg_time / n_trials);
    printf("GPU: %.10f seconds\n", comp_avg_time / n_trials);

    // If we wanted to check against CPU, do so
    if (check_cpu) {
        // Copy result from GPU
        float* C_GPU_Copy = (float*) malloc(N * N * sizeof(float));
        check_error(cudaMemcpy(C_GPU_Copy, C_GPU, N * N * sizeof(float), cudaMemcpyDeviceToHost));
        // Compare GPU and CPU output
        compareHostAndGpuOutput(C, C_GPU_Copy, N);
    }

    return 0;
}

