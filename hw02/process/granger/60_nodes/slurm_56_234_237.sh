#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_56_234_237.out
#SBATCH --error=granger/60_nodes/script_56_234_237.err
#SBATCH --job-name="234-237"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 234 -e 237 -a &> /dev/null
date +%s%N
