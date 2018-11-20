import sys
from Bio import SeqIO

if len(sys.argv) != 3:
    print("\tUsage: python fasta_length_filter.py input_file threshold")
    print()
    print("\tRemove sequences shorter than [threshold].")
    print("\tOutputs are sorted by length in descending order.")
    exit()

file_name = sys.argv[1]  # ファイル名をコマンドライン引数から取得
threshold = int(sys.argv[2])  # 閾値をコマンドライン引数から取得

records = list(SeqIO.parse(file_name, "fasta"))
records = [r for r in records if len(r) >= threshold]
records = sorted(records, key=len, reverse=True)

for r in records:
    print(r.format("fasta"))
