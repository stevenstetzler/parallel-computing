#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_55_230_233.out
#SBATCH --error=granger/60_nodes/script_55_230_233.err
#SBATCH --job-name="230-233"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 230 -e 233 -a &> /dev/null
date +%s%N
