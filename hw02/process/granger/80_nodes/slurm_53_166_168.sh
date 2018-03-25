#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_53_166_168.out
#SBATCH --error=granger/80_nodes/script_53_166_168.err
#SBATCH --job-name="166-168"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 166 -e 168 -a &> /dev/null
date +%s%N
