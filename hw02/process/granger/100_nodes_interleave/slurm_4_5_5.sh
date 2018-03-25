#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_4_5_5.out
#SBATCH --error=granger/100_nodes_interleave/script_4_5_5.err
#SBATCH --job-name="5-5"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 5 -e 5 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 105 -e 105 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 205 -e 205 -a &> /dev/null
date +%s%N
