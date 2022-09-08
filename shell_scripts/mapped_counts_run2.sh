#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8      
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --nodelist=n225     ### Run on nodes 225

#determine the number of reads mapping and not mapping to reference

/usr/bin/time -v /projects/bgmp/pmuthura/bioinfo/Bi623/QAA/PS8_2.py \
-f aligned/8_2F_fox_S7_L008_Aligned.out.sam > aligned/8_2F_fox_S7_L008_mapped_counts.txt
