#!/bin/bash
# This is a template for a simple SLURM sbatch job script file
#
# First, SBATCH options - these could be passed via the command line, but this
# is more convenient
#
#SBATCH --job-name="test" #Name of the job which appears in squeue
#
#SBATCH --mail-type=ALL #What notifications are sent by email
#SBATCH --mail-user=sgs7cr@virginia.edu
#
# Set up your user environment!!
#SBATCH --get-user-env
#
#SBATCH --error="test.err"                    # Where to write stderr
#SBATCH --output="test.out"                # Where to write stdout


srun --nodelist=artemis5 hostname
