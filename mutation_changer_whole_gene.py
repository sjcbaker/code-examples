import pandas as pd
from Bio import SeqIO

#open files
mutation_locations = pd.read_csv("Cwp20.csv",sep=",")
wt_sequence = SeqIO.read("Cwp20.fna", "fasta")

#get position and mutation data from file
positions_list = mutation_locations['position']
mutations_list = mutation_locations['mutation']

#get the wt secA sequence
secA = []
start = 0
end = len(wt_sequence)
seq = wt_sequence.seq[start:end]

#change the selected bases
for i in range(0, len(mutation_locations)):
    j = positions_list[i]
    k = mutations_list[i]
    seq = seq[:(j - 1)] + k + seq[j:]

#start = positions_list.iloc[0]
#end = positions_list.iloc[-1]
#MLST1_seq_trimmed = seq[start:end]

#output mutated sequence
print(seq)
