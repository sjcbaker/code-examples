#this script assembles contigs from 2 sorted FASTQ files

input="/workspace/home/bakersjc/C_diff/Seq_Run_1/Sorted_FASTQs3"
output="/workspace/home/bakersjc/C_diff/Seq_Run_1/spades_results5"

sample=""
for name in $input/*.fastq.gz; do
    # assuming sampleID_*_{R1,R2}*.fastq.gz
    # because there are R1 and R2 files, we can use the sample ID once to pull both files, and skip if it reappears
    if [[ $(basename $name | cut -f1 -d_) == $sample ]]; then
        continue
    else
        sample=$(basename $name |cut -f1 -d_)
    fi
    read1=""
    read2=""

    for file in $input/${sample}*.fastq.gz; do
        if [[ $file == *"_R1"* ]]; then
            read1=$file
        elif [[ $file == *"_R2"* ]]; then
            read2=$file
        fi
    done

    spades.py -t 80 -1 $read1 -2 $read2 -o $output/$sample --sc

done
