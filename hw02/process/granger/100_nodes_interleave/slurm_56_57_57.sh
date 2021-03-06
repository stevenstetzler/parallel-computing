#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_56_57_57.out
#SBATCH --error=granger/100_nodes_interleave/script_56_57_57.err
#SBATCH --job-name="57-57"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 57 -e 57 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 157 -e 157 -a &> /dev/null
date +%s%N
