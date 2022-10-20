#!/usr/bin/env bash

HOME=/home/jake

REPO=$HOME/repos/duolingo-sharedtask-2020
PROJ=$HOME/projects/duo21
RAW=$HOME/corpora/staple

DATA=$PROJ/data/staple
PREP=$PROJ/preprocess
TUNE=$PROJ/finetune

cond=$1
num=$2
lang=$3

conda activate duo21

echo $cond
echo $num

path=$DATA/$lang/${cond}_${num}

new_data=$PROJ/m2m_expts/data/${cond}_${num}

mkdir -p $new_data

echo $path

# tokenize

name=${cond}_${num}

bash $PROJ/tokenize/encode.sh $name $lang

#preprocess

srun --gres=gpu:2080:1 -t 4:00:00 bash $PREP/preprocess_duo.sh $name $lang

