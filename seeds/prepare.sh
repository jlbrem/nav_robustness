fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/seeds/data
proj=~/projects/duo21/seeds/prepped

lang=$1
seed=$2

mkdir -p $proj/$lang-en
mkdir -p $proj/$lang-en/$seed

conda activate duo21

for ver in $lang en ; do 
    for split in train dev test; do
        python $fairseq/scripts/spm_encode.py \
            --model $m2m/spm.128k.model \
            --output_format piece \
            --inputs $data/$lang/$seed/$split.$ver \
            --outputs $proj/$lang-en/$seed/$split.$ver
    done
done
