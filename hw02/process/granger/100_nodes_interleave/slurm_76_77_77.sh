#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_76_77_77.out
#SBATCH --error=granger/100_nodes_interleave/script_76_77_77.err
#SBATCH --job-name="77-77"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 77 -e 77 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 177 -e 177 -a &> /dev/null
date +%s%N