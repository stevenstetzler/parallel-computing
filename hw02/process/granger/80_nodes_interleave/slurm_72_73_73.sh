#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_72_73_73.out
#SBATCH --error=granger/80_nodes_interleave/script_72_73_73.err
#SBATCH --job-name="73-73"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 153 -e 153 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 233 -e 233 -a &> /dev/null
date +%s%N
