#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_9_10_10.out
#SBATCH --error=granger/30_nodes_interleave/script_9_10_10.err
#SBATCH --job-name="10-10"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 10 -e 10 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 40 -e 40 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 70 -e 70 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 100 -e 100 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 130 -e 130 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 160 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 190 -e 190 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 220 -e 220 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 250 -e 250 -a &> /dev/null
date +%s%N
