fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

conda activate duo21

python $fairseq/scripts/spm_encode.py \
    --model $m2m/spm.128k.model \
    --output_format piece \
    --inputs $data/ja/all/test.ja \
    --outputs $proj/spm.ja
