#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_24_25_25.out
#SBATCH --error=granger/80_nodes_interleave/script_24_25_25.err
#SBATCH --job-name="25-25"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 25 -e 25 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 105 -e 105 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 185 -e 185 -a &> /dev/null
date +%s%N
