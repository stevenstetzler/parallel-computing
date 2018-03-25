#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_92_93_93.out
#SBATCH --error=granger/100_nodes_interleave/script_92_93_93.err
#SBATCH --job-name="93-93"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 93 -e 93 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 193 -e 193 -a &> /dev/null
date +%s%N
