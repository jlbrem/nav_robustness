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

conda activate duo21

#for lang in ja; do
for lang in pt; do

    for data in $DATA/$lang/* ; do

        echo $(basename $data) 
        python sacrebleu -lc $data/test.en -i $GEN/$lang/$name/$(basename $data).last.en
    done
done
