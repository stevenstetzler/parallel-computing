#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_73_74_74.out
#SBATCH --error=granger/80_nodes_interleave/script_73_74_74.err
#SBATCH --job-name="74-74"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 74 -e 74 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 154 -e 154 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 234 -e 234 -a &> /dev/null
date +%s%N
