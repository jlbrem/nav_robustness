fairseq=~/fairseq
m2m=~/models/m2m
data=~/corpora/mtnt
proj=~/projects/duo21/mtnt

lang=$1

conda activate duo21

python $fairseq/scripts/spm_encode.py \
    --model $m2m/spm.128k.model \
    --output_format piece \
    --inputs $data/test.$lang-en.$lang \
    --outputs $proj/data/spm.$lang
