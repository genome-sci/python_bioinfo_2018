input="./input/s288c_n20.gff"
with open(input) as f:
    for line in f:
        line=line.rstrip()
        if line.startswith("#"):
            continue
        s=line.split("\t")

        items=s[8].split(";")
        for item in items:
            if item.startswith("product="):
                print(item)
