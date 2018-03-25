#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_65_66_66.out
#SBATCH --error=granger/100_nodes_interleave/script_65_66_66.err
#SBATCH --job-name="66-66"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 66 -e 66 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 166 -e 166 -a &> /dev/null
date +%s%N
