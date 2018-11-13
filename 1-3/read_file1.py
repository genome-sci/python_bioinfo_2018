## read text file by "with open"
## usage python read_file1.py

input="../1-1/reference/s288c.gff"

with open(input, 'r') as f:
    for line in f:
        line=line.rstrip()
        print(line)
