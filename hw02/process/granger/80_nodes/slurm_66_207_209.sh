#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_66_207_209.out
#SBATCH --error=granger/80_nodes/script_66_207_209.err
#SBATCH --job-name="207-209"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 207 -e 209 -a &> /dev/null
date +%s%N
