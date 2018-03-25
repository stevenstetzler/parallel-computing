#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_54_55_55.out
#SBATCH --error=granger/100_nodes_interleave/script_54_55_55.err
#SBATCH --job-name="55-55"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 55 -e 55 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 155 -e 155 -a &> /dev/null
date +%s%N
