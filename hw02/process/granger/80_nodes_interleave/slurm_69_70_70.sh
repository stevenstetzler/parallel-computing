#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_69_70_70.out
#SBATCH --error=granger/80_nodes_interleave/script_69_70_70.err
#SBATCH --job-name="70-70"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 70 -e 70 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 150 -e 150 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 230 -e 230 -a &> /dev/null
date +%s%N
