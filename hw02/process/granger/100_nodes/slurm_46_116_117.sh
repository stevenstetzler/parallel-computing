#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_46_116_117.out
#SBATCH --error=granger/100_nodes/script_46_116_117.err
#SBATCH --job-name="116-117"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 116 -e 117 -a &> /dev/null
date +%s%N
