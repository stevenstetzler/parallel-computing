#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_54_169_171.out
#SBATCH --error=granger/80_nodes/script_54_169_171.err
#SBATCH --job-name="169-171"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 169 -e 171 -a &> /dev/null
date +%s%N
