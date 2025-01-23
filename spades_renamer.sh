#this script renames the output files from spades. It appends the directory name to contigs.fasta

for file in */contigs.fasta; do
	sample=$(basename $(dirname $file));
	filename=$(basename $file);

	mv $file $(dirname $file)/${sample}_${filename};

done 
