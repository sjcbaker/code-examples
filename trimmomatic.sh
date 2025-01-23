#this script runs trimmomatic on a batch of FASTQ.gz files, stored in different subdirectories

output="/workspace/home/bakersjc/C_diff/Seq_Run_1/Trimmed_Paired_FASTQs/"
input_directory="/workspace/home/bakersjc/C_diff/Seq_Run_1"

for name in $input_directory/*; do 
    sample=$(basename $name |cut -f1 -d_)
    read1=""
    read2=""

    for file in $name/*.fastq.gz; do
        if [[ $file == *"_R1"* ]]; then
            read1=$file
        elif [[ $file == *"_R2"* ]]; then
            read2=$file
        fi
    done

    R1_paired=${sample}"_R1_paired.fastq.gz"
    R1_unpaired=${sample}"_R1_unpaired.fastq.gz"
    R2_paired=${sample}"_R2_paired.fastq.gz"
    R2_unpaired=${sample}"_R2_unpaired.fastq.gz"


trimmomatic PE -threads 80 $read1 $read2 $output$R1_paired $output$R1_unpaired $output$R2_paired $output$R2_unpaired \
 	ILLUMINACLIP:/var/miniconda3/envs/trimmomatic/share/trimmomatic-0.39-2/adapters/TruSeq3-PE.fa:2:30:10:2:True \
 	LEADING:3 TRAILING:3 MINLEN:36

done
