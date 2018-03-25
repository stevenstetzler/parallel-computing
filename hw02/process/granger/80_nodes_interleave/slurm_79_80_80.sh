#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_79_80_80.out
#SBATCH --error=granger/80_nodes_interleave/script_79_80_80.err
#SBATCH --job-name="80-80"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 80 -e 80 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 160 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 240 -e 240 -a &> /dev/null
date +%s%N
