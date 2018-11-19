"""
parse GFF file
extract "gene_id" and "product" from "mRNA"

usage python3 parse_gff.py
"""

import urllib.parse

input="../1-1/reference/s288c_e.gff"
output="output/gene_id_product.tsv"
dict={}

## parse GFF
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

        dict[gene]=product

## write gene_id-->product
with open(output, 'w') as f:
    for key, val in dict.items():
        f.write(key+"\t"+val+"\n")
