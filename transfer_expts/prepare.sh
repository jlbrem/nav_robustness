fairseq=~/fairseq
m2m=~/models/m2m
data=~/corpora/opus
proj=~/projects/duo21/transfer_expts

lang=$1

conda activate duo21

python $fairseq/scripts/spm_encode.py \
    --model $m2m/spm.128k.model \
    --output_format piece \
    --inputs $data/$lang-en/test1.$lang \
    --outputs $proj/data/spm.$lang
