#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_87_88_88.out
#SBATCH --error=granger/100_nodes_interleave/script_87_88_88.err
#SBATCH --job-name="88-88"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 88 -e 88 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 188 -e 188 -a &> /dev/null
date +%s%N
