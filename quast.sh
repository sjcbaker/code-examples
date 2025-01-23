# this script runs QUAST on a batch of trimmed paired fastqs
output="/workspace/home/bakersjc/C_diff/Seq_Run_1/QUAST_results4"
input="/workspace/home/bakersjc/C_diff/Seq_Run_1/spades_results5"

for name in $input/*/*_contigs.fasta; do
	sample=$(basename $name |cut -f1 -d_)

	quast.py -t 80 -m 50 -r /workspace/home/bakersjc/C_diff/C_diff_reference.fasta -o $output/$sample"_QUAST" \
	$input/*/*_contigs.fasta

done
