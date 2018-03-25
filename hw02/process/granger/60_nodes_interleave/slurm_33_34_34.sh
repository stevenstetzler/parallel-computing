#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_33_34_34.out
#SBATCH --error=granger/60_nodes_interleave/script_33_34_34.err
#SBATCH --job-name="34-34"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 34 -e 34 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 94 -e 94 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 154 -e 154 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 214 -e 214 -a &> /dev/null
date +%s%N
