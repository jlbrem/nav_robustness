#!/usr/bin/env bash

cond=$1
lang=$2

HOME=/home/jake/projects/duo21
DATA=$HOME/preprocess/$lang/duo/$cond
OUT=$HOME/finetune/$lang/$cond

conda activate duo21

fairseq-train $DATA \
       	--arch transformer \
	--optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
	--lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
	--dropout 0.3 --weight-decay 0.0001 \
	--criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
	--max-tokens 4096 \
	--save-dir $OUT \
	--no-epoch-checkpoints \
	--patience 10 \
    --reset-meters \
    --restore-file $HOME/train/$lang/tatoeba/checkpoint_best.pt

