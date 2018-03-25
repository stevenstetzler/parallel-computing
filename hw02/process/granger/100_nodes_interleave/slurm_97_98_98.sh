#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_97_98_98.out
#SBATCH --error=granger/100_nodes_interleave/script_97_98_98.err
#SBATCH --job-name="98-98"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 98 -e 98 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 198 -e 198 -a &> /dev/null
date +%s%N
