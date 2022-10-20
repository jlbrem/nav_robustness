#!/usr/bin/env bash

HOME=/home/jake/projects/duo21
DATA=$HOME/preprocess
OUT=$HOME/decode
model=$1
lang=$2
data=$3

conda activate duo21

fairseq-generate $DATA/$lang/duo/$data \
    --path $HOME/finetune/$lang/$model/checkpoint_last.pt \
    --batch-size 128 --beam 5 --remove-bpe > $OUT/$lang/$model/$data.last

