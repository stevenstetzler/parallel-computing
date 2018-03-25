#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_95_238_240.out
#SBATCH --error=granger/100_nodes/script_95_238_240.err
#SBATCH --job-name="238-240"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 240 -a &> /dev/null
date +%s%N
