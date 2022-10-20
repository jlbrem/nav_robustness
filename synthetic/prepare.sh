fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/synthetic/data
proj=~/projects/duo21/synthetic/prepped

lang=$1

mkdir -p $proj/$lang-en

conda activate duo21

for ver in $lang en ; do 
#    for split in train dev ; do
    for split in test ; do    
        python $fairseq/scripts/spm_encode.py \
            --model $m2m/spm.128k.model \
            --output_format piece \
            --inputs $data/$lang-en/$split.$ver \
            --outputs $proj/$lang-en/$split.$ver
    done
done
