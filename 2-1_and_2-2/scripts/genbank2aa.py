import sys
from Bio import SeqIO

if len(sys.argv) != 2:
    print("\tUsage: python genbank2aa.py input_file > output_file")
    print()
    print("\tExtract amino acid sequences from CDS features in a gbk file.")
    exit()

gbk_file_name = sys.argv[1]  # ファイル名をコマンドライン引数から取得

for record in SeqIO.parse(gbk_file_name, "genbank"):
    for feature in record.features:
        locus_tag = feature.qualifiers.get("locus_tag", [""])[0]  # get 関数を使い locus_tag qualifierが存在しない場合には  [""] を返す
        translation = feature.qualifiers.get("translation", [""])[0]
        product = feature.qualifiers.get("product", ["UNKOWN PRODUCT"])[0]
        if locus_tag and translation:
            print(">" + locus_tag + " " + product)
            print(translation)

