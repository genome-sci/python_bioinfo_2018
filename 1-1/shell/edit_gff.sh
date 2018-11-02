#$ -S /bin/bash
#$ -pe def_slot 8
#$ -cwd
#$ -l mem_req=8G,s_vmem=8G
#$ -l debug

pyenv shell 3.6.1

cd reference
python ../program/add_gene_id s288c.gff s288c_e.gff

