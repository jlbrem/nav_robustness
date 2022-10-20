#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
proj=~/projects/duo21/synthetic

src=$1
tgt=en 

data=$proj/prepped/$src-$tgt

conda activate duo21

fairseq-preprocess \
    --source-lang $src \
    --trainpref $data/train \
    --validpref $data/dev \
    --testpref $data/test \
    --target-lang $tgt \
    --thresholdsrc 0 \
    --destdir $data \
    --srcdict $m2m/model_dict.128k.txt \
    --tgtdict $m2m/model_dict.128k.txt
