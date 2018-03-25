#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes/script_10_63_68.out
#SBATCH --error=granger/40_nodes/script_10_63_68.err
#SBATCH --job-name="63-68"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 63 -e 68 -a &> /dev/null
date +%s%N
