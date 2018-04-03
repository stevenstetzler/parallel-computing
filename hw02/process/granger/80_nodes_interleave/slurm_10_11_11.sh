#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_10_11_11.out
#SBATCH --error=granger/80_nodes_interleave/script_10_11_11.err
#SBATCH --job-name="11-11"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 11 -e 11 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 91 -e 91 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 171 -e 171 -a &> /dev/null
date +%s%N