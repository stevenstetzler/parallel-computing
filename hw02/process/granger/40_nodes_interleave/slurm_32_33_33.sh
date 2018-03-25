#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes_interleave/script_32_33_33.out
#SBATCH --error=granger/40_nodes_interleave/script_32_33_33.err
#SBATCH --job-name="33-33"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 33 -e 33 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 113 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 153 -e 153 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 193 -e 193 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 233 -e 233 -a &> /dev/null
date +%s%N
