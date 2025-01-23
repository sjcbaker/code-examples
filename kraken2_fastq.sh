#This script runs kraken2 on a batch of files.

input="/workspace/home/bakersjc/C_diff/Seq_Run_1"
output="/workspace/home/bakersjc/C_diff/Seq_Run_1/kraken2_fastq_results"

for name in $input/*/*.fastq.gz; do
	sample=$(basename $name |cut -f1 -d_)

	kraken2 --db /var/miniconda3/envs/kraken2/data \
	 --threads 80 --use-names --output $output/${sample}_kraken2 $name

done
