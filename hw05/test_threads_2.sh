#!/bin/sh

./mat 10000 0 1 1 1 > mat_mul_threads_2.out
./mat 10000 0 1 128 1 >> mat_mul_threads_2.out
./mat 10000 0 1 256 1 >> mat_mul_threads_2.out
./mat 10000 0 1 384 1 >> mat_mul_threads_2.out
./mat 10000 0 1 512 1 >> mat_mul_threads_2.out
./mat 10000 0 1 640 1 >> mat_mul_threads_2.out
./mat 10000 0 1 768 1 >> mat_mul_threads_2.out
./mat 10000 0 1 896 1 >> mat_mul_threads_2.out
./mat 10000 0 1 1024 1 >> mat_mul_threads_2.out

./mat 10000 0 2 2 1 >> mat_mul_threads_2.out
./mat 10000 0 2 64 1 >> mat_mul_threads_2.out
./mat 10000 0 2 128 1 >> mat_mul_threads_2.out
./mat 10000 0 2 192 1 >> mat_mul_threads_2.out
./mat 10000 0 2 256 1 >> mat_mul_threads_2.out
./mat 10000 0 2 320 1 >> mat_mul_threads_2.out
./mat 10000 0 2 384 1 >> mat_mul_threads_2.out
./mat 10000 0 2 448 1 >> mat_mul_threads_2.out
./mat 10000 0 2 512 1 >> mat_mul_threads_2.out

./mat 10000 0 4 4 1 >> mat_mul_threads_2.out
./mat 10000 0 4 32 1 >> mat_mul_threads_2.out
./mat 10000 0 4 64 1 >> mat_mul_threads_2.out
./mat 10000 0 4 96 1 >> mat_mul_threads_2.out
./mat 10000 0 4 128 1 >> mat_mul_threads_2.out
./mat 10000 0 4 160 1 >> mat_mul_threads_2.out
./mat 10000 0 4 192 1 >> mat_mul_threads_2.out
./mat 10000 0 4 224 1 >> mat_mul_threads_2.out
./mat 10000 0 4 256 1 >> mat_mul_threads_2.out

./mat 10000 0 8 8 1 >> mat_mul_threads_2.out
./mat 10000 0 8 16 1 >> mat_mul_threads_2.out
./mat 10000 0 8 32 1 >> mat_mul_threads_2.out
./mat 10000 0 8 48 1 >> mat_mul_threads_2.out
./mat 10000 0 8 64 1 >> mat_mul_threads_2.out
./mat 10000 0 8 80 1 >> mat_mul_threads_2.out
./mat 10000 0 8 96 1 >> mat_mul_threads_2.out
./mat 10000 0 8 112 1 >> mat_mul_threads_2.out
./mat 10000 0 8 128 1 >> mat_mul_threads_2.out

./mat 10000 0 16 8 1 >> mat_mul_threads_2.out
./mat 10000 0 16 16 1 >> mat_mul_threads_2.out
./mat 10000 0 16 24 1 >> mat_mul_threads_2.out
./mat 10000 0 16 32 1 >> mat_mul_threads_2.out
./mat 10000 0 16 40 1 >> mat_mul_threads_2.out
./mat 10000 0 16 48 1 >> mat_mul_threads_2.out
./mat 10000 0 16 56 1 >> mat_mul_threads_2.out
./mat 10000 0 16 64 1 >> mat_mul_threads_2.out

./mat 10000 0 32 4 1 >> mat_mul_threads_2.out
./mat 10000 0 32 8 1 >> mat_mul_threads_2.out
./mat 10000 0 32 12 1 >> mat_mul_threads_2.out
./mat 10000 0 32 16 1 >> mat_mul_threads_2.out
./mat 10000 0 32 20 1 >> mat_mul_threads_2.out
./mat 10000 0 32 24 1 >> mat_mul_threads_2.out
./mat 10000 0 32 28 1 >> mat_mul_threads_2.out
./mat 10000 0 32 32 1 >> mat_mul_threads_2.out
