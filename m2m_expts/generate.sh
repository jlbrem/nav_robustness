#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

HOME=/home/jake/projects/duo21
DATA=$proj/data_bin
OUT=$proj/out

source activate duo21

fairseq-generate $DATA \
    --batch-size 64 --path $m2m/1.2B_last_checkpoint.pt \
    --fixed-dictionary $m2m/model_dict.128k.txt \
    -s ja -t en --remove-bpe 'sentencepiece' --beam 5 \
    --task translation_multi_simple_epoch --lang-pairs $m2m/language_pairs_small_models.txt \
    --decoder-langtok --encoder-langtok src --gen-subset test > $OUT/gen_out
