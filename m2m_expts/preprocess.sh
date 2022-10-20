#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

src=ja
tgt=en 


source activate duo21

fairseq-preprocess \
    --source-lang $src \
    --target-lang $tgt \
    --testpref spm \
    --thresholdsrc 0 \
    --only-source \
    --destdir $proj/data_bin \
    --srcdict $m2m/data_dict.128k.txt