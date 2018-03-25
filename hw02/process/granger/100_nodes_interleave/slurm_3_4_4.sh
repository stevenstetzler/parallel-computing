#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_3_4_4.out
#SBATCH --error=granger/100_nodes_interleave/script_3_4_4.err
#SBATCH --job-name="4-4"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 4 -e 4 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 104 -e 104 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 204 -e 204 -a &> /dev/null
date +%s%N
