#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_27_28_28.out
#SBATCH --error=granger/100_nodes_interleave/script_27_28_28.err
#SBATCH --job-name="28-28"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 28 -e 28 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 128 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 228 -e 228 -a &> /dev/null
date +%s%N
