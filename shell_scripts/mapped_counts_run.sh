#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8      
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --nodelist=n225     ### Run on nodes 225

in_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA

/usr/bin/time -v python3 PS8.py $in_dir/aligned/8_2F_fox_S7_L008_Aligned.out.sam > $in_dir/aligned/8_2F_fox_S7_L008_mapped_counts.txt

#/usr/bin/time -v python3 PS8.py $in_dir/aligned/14_3B_control_S10_L008_Aligned.out.sam > $in_dir/aligned/14_3B_control_S10_L008_mapped_counts.txt