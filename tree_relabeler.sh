#this script takes a list of files in a tsv, searches for column 1 in your result file, and replaces with column 2
input="C_diff_run_1_idents_relabel_3.tsv"
results="Seq_1_relabeled.result" # make a backup of this file

while read -r line; do
    target=$(echo $line | cut -d" " -f1 | tr -d " \t\n\r")
    replacement=$(echo $line | cut -d " " -f2 | tr -d " \t\n\r")
echo $target
echo $replacement

   sed -i "s/${target}/${replacement}/g" $results
done < $input
