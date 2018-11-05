import sys
from BCBio import GFF

# usage
# python parse_sam.py

with open(out_file_name, "w") as fh:
    GFF.write(records, fh)
