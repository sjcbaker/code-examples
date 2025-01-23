#this script sorts paired fastq sequences 

input="/workspace/home/bakersjc/C_diff/Seq_Run_1/Trimmed_Paired_FASTQs"
output="/workspace/home/bakersjc/C_diff/Seq_Run_1/Sorted_FASTQs3"

for file in $input/*_paired.fastq.gz; do
	sample=$(basename $file |cut -f1 -d_)
	read1=""
	read2=""

	if [[ $file == *"_R1"* ]]; then
		read1=$file
		zcat -f $read1 | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" | \
		gzip > $output/$sample"_R1_sorted.fastq.gz"

	elif [[ $file == *"_R2"* ]]; then
		read2=$file
		zcat -f $read2 | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" | \
		gzip > $output/$sample"_R2_sorted.fastq.gz"

	fi

done
