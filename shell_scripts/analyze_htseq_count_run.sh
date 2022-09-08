#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --nodelist=n226         ### Run on node 226

#count the number of reads mapping to a feature and the total reads (using htseq-count output) in order to
#determine whether the data is stranded or unstranded

# FOX STRANDED
echo '8_2F_fox_S7_L008.stranded.genecount:' > aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/8_2F_fox_S7_L008.stranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/8_2F_fox_S7_L008.stranded.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

#FOX REVERSE
echo '8_2F_fox_S7_L008.reverse.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/8_2F_fox_S7_L008.reverse.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/8_2F_fox_S7_L008.reverse.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

#CONTROL STRANDED
echo '14_3B_control_S10_L008.stranded.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/14_3B_control_S10_L008.stranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/14_3B_control_S10_L008.stranded.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

#CONTROL REVERSE
echo '14_3B_control_S10_L008.reverse.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/14_3B_control_S10_L008.reverse.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/14_3B_control_S10_L008.reverse.genecount >> aligned/htseq_count_stats.txt

exit