#!/usr/bin/env bash

source activate duo21

lang=$1

DATA=/home/jake/projects/duo21/transfer_expts/eval/$lang-en

for name in $DATA/* ; do
    echo $(basename $name)
    python sacrebleu -lc -b $DATA/gold -i $name
done

