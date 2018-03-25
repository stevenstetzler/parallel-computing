#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_73_229_231.out
#SBATCH --error=granger/80_nodes/script_73_229_231.err
#SBATCH --job-name="229-231"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 229 -e 231 -a &> /dev/null
date +%s%N
