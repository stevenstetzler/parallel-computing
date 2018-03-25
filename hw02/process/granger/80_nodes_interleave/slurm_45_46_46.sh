#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_45_46_46.out
#SBATCH --error=granger/80_nodes_interleave/script_45_46_46.err
#SBATCH --job-name="46-46"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 46 -e 46 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 126 -e 126 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 206 -e 206 -a &> /dev/null
date +%s%N
