#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_75_76_76.out
#SBATCH --error=granger/80_nodes_interleave/script_75_76_76.err
#SBATCH --job-name="76-76"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 76 -e 76 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 156 -e 156 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 236 -e 236 -a &> /dev/null
date +%s%N
