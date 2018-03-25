#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_62_63_63.out
#SBATCH --error=granger/100_nodes_interleave/script_62_63_63.err
#SBATCH --job-name="63-63"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 63 -e 63 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 163 -a &> /dev/null
date +%s%N
