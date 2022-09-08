#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --cpus-per-task=8       ### Number of cpus (cores) per task
#SBATCH --nodelist=n226         ### Run on node 226

conda activate QAA

in_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA/trimmed_paired

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $in_dir/8_2F_fox_S7_L008_R1_001.trimmed.paired.fastq.gz $in_dir/8_2F_fox_S7_L008_R2_001.trimmed.paired.fastq.gz \
--genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
--outFileNamePrefix 8_2F_fox_S7_L008_

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $in_dir/14_3B_control_S10_L008_R1_001.trimmed.paired.fastq.gz $in_dir/14_3B_control_S10_L008_R2_001.trimmed.paired.fastq.gz \
--genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
--outFileNamePrefix 14_3B_control_S10_L008_

exit