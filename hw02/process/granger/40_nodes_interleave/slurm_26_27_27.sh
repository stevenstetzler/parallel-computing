#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes_interleave/script_26_27_27.out
#SBATCH --error=granger/40_nodes_interleave/script_26_27_27.err
#SBATCH --job-name="27-27"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 27 -e 27 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 67 -e 67 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 107 -e 107 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 147 -e 147 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 187 -e 187 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 227 -e 227 -a &> /dev/null
date +%s%N
