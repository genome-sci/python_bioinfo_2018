input="./input/s288c_n20.gff"
with open(input) as f:
for line in f:
    line=line.rstrip()
    if line.startswith("#"):
        print(line)
