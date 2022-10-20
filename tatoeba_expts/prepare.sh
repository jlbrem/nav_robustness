fairseq=~/fairseq
m2m=~/models/m2m
data=~/corpora/tatoeba
proj=~/projects/duo21/tatoeba_expts

lang=$1

conda activate duo21

python $fairseq/scripts/spm_encode.py \
    --model $m2m/spm.128k.model \
    --output_format piece \
    --inputs $data/$lang-en/$lang.test \
    --outputs $proj/data/spm.$lang
