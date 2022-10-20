#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

cond=$1
src=$2
tgt=en

conda activate duo21

mkdir -p $proj/prepped/$src
mkdir -p $proj/prepped/$src/$cond

TEXT=$proj/data/$src/$cond

    fairseq-preprocess \
        --source-lang $src \
        --target-lang $tgt \
        --trainpref $TEXT/train --validpref $TEXT/dev --testpref $TEXT/test \
        --thresholdsrc 0 \
        --destdir $proj/prepped/$src/$cond \
        --srcdict $m2m/model_dict.128k.txt \
        --tgtdict $m2m/model_dict.128k.txt
