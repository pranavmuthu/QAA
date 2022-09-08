#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --nodelist=n226         ### Run on node 226

module load fastqc/0.11.5

input_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA/trimmed_paired
output_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA/trimmed_fastqc_output/

/usr/bin/time -v fastqc \
$input_dir/14_3B_control_S10_L008_R1_001.trimmed.paired.fastq.gz \
$input_dir/14_3B_control_S10_L008_R2_001.trimmed.paired.fastq.gz \
$input_dir/8_2F_fox_S7_L008_R1_001.trimmed.paired.fastq.gz \
$input_dir/8_2F_fox_S7_L008_R2_001.trimmed.paired.fastq.gz \
-o $output_dir

exit