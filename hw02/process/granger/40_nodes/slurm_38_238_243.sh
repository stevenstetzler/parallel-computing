#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes/script_38_238_243.out
#SBATCH --error=granger/40_nodes/script_38_238_243.err
#SBATCH --job-name="238-243"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 243 -a &> /dev/null
date +%s%N
