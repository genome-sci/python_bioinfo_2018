input="../1-1/sam/SRR453566.sam.aa"
dict={}
with open(input) as f:
    for line in f:
        line=line.rstrip()
        if line.startswith("@"):
            continue
        s=line.split("\t")
        flg=s[1]

        if flg in dict:
            dict[flg]+=1
        else :
            dict[flg]=1
for k, v in dict.items():
    print(k+"\t"+str(v))
