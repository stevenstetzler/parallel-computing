#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_18_19_19.out
#SBATCH --error=slurm/22_nodes_interleave/script_18_19_19.err
#SBATCH --job-name="19-19"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 19 -e 19 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 41 -e 41 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 63 -e 63 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 85 -e 85 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 107 -e 107 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 129 -e 129 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 151 -e 151 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 173 -e 173 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 195 -e 195 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 217 -e 217 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 239 -e 239 -a &> /dev/null
date +%s%N
