#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_58_59_59.out
#SBATCH --error=granger/80_nodes_interleave/script_58_59_59.err
#SBATCH --job-name="59-59"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 59 -e 59 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 139 -e 139 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 219 -e 219 -a &> /dev/null
date +%s%N
