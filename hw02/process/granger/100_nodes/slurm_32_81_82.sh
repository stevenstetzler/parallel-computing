#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_32_81_82.out
#SBATCH --error=granger/100_nodes/script_32_81_82.err
#SBATCH --job-name="81-82"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 81 -e 82 -a &> /dev/null
date +%s%N
