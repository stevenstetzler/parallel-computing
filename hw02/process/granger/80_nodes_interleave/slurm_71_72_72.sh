#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_71_72_72.out
#SBATCH --error=granger/80_nodes_interleave/script_71_72_72.err
#SBATCH --job-name="72-72"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 152 -e 152 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 232 -e 232 -a &> /dev/null
date +%s%N
