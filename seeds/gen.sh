#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/data/staple
proj=~/projects/duo21/m2m_expts
synth=~/projects/duo21/seeds

HOME=/home/jake/projects/duo21

lang=$1
seed=$2

DATA=$proj/prepped/$lang/all_0
PREOUT=$synth/decode/$lang-en
OUT=$PREOUT/$seed
MODEL=$synth/finetune/$lang-en/$seed/checkpoint_best.pt

mkdir -p $PREOUT
mkdir -p $OUT

conda activate duo21

fairseq-generate $DATA \
    --batch-size 100 --path $MODEL \
    --fixed-dictionary $m2m/model_dict.128k.txt \
    -s $lang -t en --remove-bpe 'sentencepiece' --beam 5 \
    --task translation_multi_simple_epoch --lang-pairs $m2m/language_pairs_small_models.txt \
    --decoder-langtok --encoder-langtok src --gen-subset test > $OUT/gen_out
