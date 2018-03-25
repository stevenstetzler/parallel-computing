#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_58_182_184.out
#SBATCH --error=granger/80_nodes/script_58_182_184.err
#SBATCH --job-name="182-184"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 182 -e 184 -a &> /dev/null
date +%s%N
