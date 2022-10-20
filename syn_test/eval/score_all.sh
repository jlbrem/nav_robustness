#!/usr/bin/env bash

source activate duo21

lang=$1

DATA=/home/jake/projects/duo21/syn_test/eval/$lang

for name in $DATA/* ; do
    echo $(basename $name)
    python metrics.py $name $DATA/gold
    python sacrebleu -lc -b $DATA/gold -i $name
done


