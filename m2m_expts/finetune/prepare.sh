fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

cond=$1
src=$2

conda activate duo21

mkdir -p $proj/data/$src
mkdir -p $proj/data/$src/$cond

for split in train dev test ; do 
    for lang in $src en ; do

        python $fairseq/scripts/spm_encode.py \
            --model $m2m/spm.128k.model \
            --output_format piece \
            --inputs $data/$src/$cond/$split.$lang \
            --outputs $proj/data/$src/$cond/$split.$lang 

    done
done
