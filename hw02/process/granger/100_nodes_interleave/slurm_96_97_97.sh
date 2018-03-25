#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_96_97_97.out
#SBATCH --error=granger/100_nodes_interleave/script_96_97_97.err
#SBATCH --job-name="97-97"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 97 -e 97 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 197 -e 197 -a &> /dev/null
date +%s%N
