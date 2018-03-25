#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_19_20_20.out
#SBATCH --error=granger/30_nodes_interleave/script_19_20_20.err
#SBATCH --job-name="20-20"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 20 -e 20 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 50 -e 50 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 80 -e 80 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 110 -e 110 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 140 -e 140 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 170 -e 170 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 200 -e 200 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 230 -e 230 -a &> /dev/null
date +%s%N
