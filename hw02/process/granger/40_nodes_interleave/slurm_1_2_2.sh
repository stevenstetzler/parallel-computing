#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes_interleave/script_1_2_2.out
#SBATCH --error=granger/40_nodes_interleave/script_1_2_2.err
#SBATCH --job-name="2-2"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 2 -e 2 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 42 -e 42 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 82 -e 82 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 122 -e 122 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 162 -e 162 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 202 -e 202 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 242 -e 242 -a &> /dev/null
date +%s%N
