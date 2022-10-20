#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
proj=~/projects/duo21/transfer_expts
data=$proj/data

src=$1
tgt=en 

conda activate duo21

fairseq-preprocess \
    --source-lang $src \
    --target-lang $tgt \
    --testpref $data/spm \
    --thresholdsrc 0 \
    --only-source \
    --destdir $data \
    --srcdict $m2m/model_dict.128k.txt