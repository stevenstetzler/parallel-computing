#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_80_81_81.out
#SBATCH --error=granger/100_nodes_interleave/script_80_81_81.err
#SBATCH --job-name="81-81"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 81 -e 81 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 181 -e 181 -a &> /dev/null
date +%s%N
