import urllib.parse

input="../1-1/reference/s288c_e.gff"
with open(input) as f:
    for line in f:
        line=line.rstrip()
        if line.startswith("#"):
            continue
        s=line.split("\t")

        if s[2]!="mRNA":
            continue

        if "pseudo=true" in s[8]:
            continue

        items=s[8].split(";")
        gene=""
        product=""

        for item in items:
            if item.startswith("product="):
                product=item.replace("product=","")
                product=urllib.parse.unquote(product)
            if item.startswith("gene_id="):
                gene=item.replace("gene_id=","")

        print(gene+"\t"+product)
