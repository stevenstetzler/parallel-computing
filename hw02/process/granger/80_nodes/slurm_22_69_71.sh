#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_22_69_71.out
#SBATCH --error=granger/80_nodes/script_22_69_71.err
#SBATCH --job-name="69-71"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 69 -e 71 -a &> /dev/null
date +%s%N
