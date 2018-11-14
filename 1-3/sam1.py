input="../1-1/sam/SRR453566.sam.aa"
readList=[]
with open(input) as f:
    for line in f:
        line=line.rstrip()
        if line.startswith("@"):
            continue
        s=line.split("\t")
        FLG=int(s[1])
        if FLG & 4:
            readList.append(s[0])
for item in readList:
    print(item)
