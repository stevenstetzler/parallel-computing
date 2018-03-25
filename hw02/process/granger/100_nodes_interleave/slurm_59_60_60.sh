#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_59_60_60.out
#SBATCH --error=granger/100_nodes_interleave/script_59_60_60.err
#SBATCH --job-name="60-60"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 60 -e 60 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 160 -a &> /dev/null
date +%s%N
