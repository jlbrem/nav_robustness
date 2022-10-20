#!/usr/bin/env bash

HOME=/home/jake

REPO=$HOME/repos/duolingo-sharedtask-2020
PROJ=$HOME/projects/duo21
RAW=$HOME/corpora/staple

DATA=$PROJ/data/staple
PREP=$PROJ/preprocess
TUNE=$PROJ/finetune
GEN=$PROJ/decode

name=$1

source activate duo21

#for lang in ja; do
for lang in pt; do

    mkdir -p $GEN/$lang/$name
    
    for data in $PREP/$lang/duo/*; do

        echo $(basename $data)

        if [ -f $GEN/$lang/$name/$(basename $data) ];
        then
            echo "file already exists!"
            continue
        fi 

        srun --gres=gpu:2080:1 -t 4:00:00 bash $GEN/generate.sh $name $lang $(basename $data)

        bash $GEN/get_h.sh $GEN/$lang/$name/$(basename $data) > $GEN/$lang/$name/$(basename $data).en
    done
done
