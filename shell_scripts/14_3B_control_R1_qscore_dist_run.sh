#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --nodelist=n228         ### Run on node 228

conda activate bgmp_py310

/usr/bin/time -v ./part1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz -l 101 -o 14_3B_control_R1

exit