#!/usr/bin/env bash

HOME=/home/jake/projects/duo21
DATA=$HOME/data/staple
TOK=$HOME/tokenize

cond=$1
lang=$2

path=$DATA/$lang/$cond

mkdir -p $TOK/$lang/duo/$cond

conda activate duo21

for split in train dev test; do
    for ver in en $lang; do
        python $HOME/tokenize/$lang/encode_sp.py $path/$split.$ver $TOK/$lang/$ver > $TOK/$lang/duo/$cond/$split.$ver
    done
done    
		



