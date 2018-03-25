#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes/script_19_238_250.out
#SBATCH --error=granger/20_nodes/script_19_238_250.err
#SBATCH --job-name="238-250"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 250 -a &> /dev/null
date +%s%N
