#!/bin/sh

export OUT="mat_mul_output.txt"

hostname &> $OUT

./mat 1000 1 &> $OUT
./mat 1000 &> $OUT
./mat 2000 &> $OUT
./mat 3000 &> $OUT
./mat 4000 &> $OUT
./mat 5000 &> $OUT
./mat 6000 &> $OUT
./mat 7000 &> $OUT
./mat 8000 &> $OUT
./mat 9000 &> $OUT
./mat 10000 &> $OUT
