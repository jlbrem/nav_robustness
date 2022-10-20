#!/usr/bin/env bash

conda activate duo21

lang=$1

DATA=/home/jake/projects/duo21/synthetic/eval/$lang/least

for name in $DATA/* ; do
    echo $(basename $name)
    python sacrebleu -lc -b $DATA/gold.least -i $name
done

