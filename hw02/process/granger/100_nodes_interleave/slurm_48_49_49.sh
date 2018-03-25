#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_48_49_49.out
#SBATCH --error=granger/100_nodes_interleave/script_48_49_49.err
#SBATCH --job-name="49-49"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 49 -e 49 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 149 -e 149 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 249 -e 249 -a &> /dev/null
date +%s%N
