#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_43_44_44.out
#SBATCH --error=granger/100_nodes_interleave/script_43_44_44.err
#SBATCH --job-name="44-44"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 44 -e 44 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 144 -e 144 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 244 -e 244 -a &> /dev/null
date +%s%N
