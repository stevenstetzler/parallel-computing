#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes/script_21_176_183.out
#SBATCH --error=granger/30_nodes/script_21_176_183.err
#SBATCH --job-name="176-183"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 176 -e 183 -a &> /dev/null
date +%s%N
