#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts

HOME=/home/jake/projects/duo21

cond=$1
lang=$2

DATA=$proj/prepped/$lang/all_0
OUT=$proj/decode/$lang/$cond
MODEL=$proj/finetune/checkpoints/$lang/$cond/checkpoint_best.pt

mkdir -p $OUT

conda activate duo21

fairseq-generate $DATA \
    --batch-size 64 --path $MODEL \
    --fixed-dictionary $m2m/model_dict.128k.txt \
    -s $lang -t en --remove-bpe 'sentencepiece' --beam 5 \
    --task translation_multi_simple_epoch --lang-pairs $m2m/language_pairs_small_models.txt \
    --decoder-langtok --encoder-langtok src --gen-subset test > $OUT/gen_out
