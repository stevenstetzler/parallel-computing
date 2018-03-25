#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_34_35_35.out
#SBATCH --error=granger/80_nodes_interleave/script_34_35_35.err
#SBATCH --job-name="35-35"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 35 -e 35 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 115 -e 115 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 195 -e 195 -a &> /dev/null
date +%s%N
