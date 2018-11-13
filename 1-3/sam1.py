"""
parse sam file

usage python3 parse_sam.py
"""

input="../1-1/sam/SRR453566.sam.aa"
list=[]

## parse sam
with open(input) as f:
    for line in f:
        line=line.rstrip()
        if line.startswith("@"):
            continue
        s=line.split("\t")
        FLG=int(s[1])
        if FLG & 4:
            list.append(s[0])

for item in list:
    print(item)
