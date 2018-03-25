#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_4_5_5.out
#SBATCH --error=granger/30_nodes_interleave/script_4_5_5.err
#SBATCH --job-name="5-5"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 5 -e 5 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 35 -e 35 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 65 -e 65 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 95 -e 95 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 125 -e 125 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 155 -e 155 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 185 -e 185 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 215 -e 215 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 245 -e 245 -a &> /dev/null
date +%s%N
