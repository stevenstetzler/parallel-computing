#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/10_nodes_interleave/script_9_10_10.out
#SBATCH --error=granger/10_nodes_interleave/script_9_10_10.err
#SBATCH --job-name="10-10"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 10 -e 10 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 20 -e 20 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 30 -e 30 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 40 -e 40 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 50 -e 50 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 60 -e 60 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 70 -e 70 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 80 -e 80 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 90 -e 90 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 100 -e 100 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 110 -e 110 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 120 -e 120 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 130 -e 130 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 140 -e 140 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 150 -e 150 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 160 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 170 -e 170 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 180 -e 180 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 190 -e 190 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 200 -e 200 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 210 -e 210 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 220 -e 220 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 230 -e 230 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 240 -e 240 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 250 -e 250 -a &> /dev/null
date +%s%N
