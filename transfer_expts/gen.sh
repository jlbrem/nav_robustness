#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/transfer_expts/prepped
proj=~/projects/duo21/m2m_expts
tran=~/projects/duo21/transfer_expts

HOME=/home/jake/projects/duo21

cond=$1
lang=$2
model=$3

DATA=$data/$lang-en
PREOUT=$tran/decode/$lang-en/$model
OUT=$PREOUT/$cond
MODEL=$proj/finetune/checkpoints/$model/$cond/checkpoint_best.pt

mkdir -p $PREOUT
mkdir -p $OUT

conda activate duo21

fairseq-generate $DATA \
    --batch-size 64 --path $MODEL \
    --fixed-dictionary $m2m/model_dict.128k.txt \
    -s $lang -t en --remove-bpe 'sentencepiece' --beam 5 \
    --task translation_multi_simple_epoch --lang-pairs $m2m/language_pairs_small_models.txt \
    --decoder-langtok --encoder-langtok src --gen-subset test > $OUT/gen_out
