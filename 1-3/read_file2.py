## read text file by "f=open"
## usage python read_file2.py

input="../1-1/reference/s288c.gff"

f=open(input, 'r')
for line in f:
    line=line.rstrip()
    print(line)

f.close()
