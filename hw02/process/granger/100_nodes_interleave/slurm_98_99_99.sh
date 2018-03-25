#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_98_99_99.out
#SBATCH --error=granger/100_nodes_interleave/script_98_99_99.err
#SBATCH --job-name="99-99"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 99 -e 99 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 199 -e 199 -a &> /dev/null
date +%s%N
