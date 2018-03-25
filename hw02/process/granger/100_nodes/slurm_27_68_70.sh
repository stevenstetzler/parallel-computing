#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_27_68_70.out
#SBATCH --error=granger/100_nodes/script_27_68_70.err
#SBATCH --job-name="68-70"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 70 -a &> /dev/null
date +%s%N
