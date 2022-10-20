#!/usr/bin/env bash

HOME=/home/jake

REPO=$HOME/repos/duolingo-sharedtask-2020
PROJ=$HOME/projects/duo21
RAW=$HOME/corpora/staple

DATA=$PROJ/seeds/data
PREP=$PROJ/seeds/preprocess
TUNE=$PROJ/seeds/finetune

lang=$1
seed=$2

conda activate duo21

echo $lang
echo $seed

path=$DATA/$lang/$seed

echo $path

mkdir -p $path

# extract data
    
python $REPO/get_traintest_data.py --fname $RAW/en_$lang/train.en_$lang.2020-01-13.gold.txt --srcfname $path/train.en --tgtfname $path/train.$lang --prefix random --num 10 --seed $seed
python $REPO/get_traintest_data.py --fname $RAW/en_$lang/dev.en_$lang.2020-02-20.gold.txt --srcfname $path/dev.en --tgtfname $path/dev.$lang --prefix random --num 10 --seed $seed
python $REPO/get_traintest_data.py --fname $RAW/en_$lang/test.en_$lang.2020-02-20.gold.txt --srcfname $path/test.en --tgtfname $path/test.$lang --prefix random --num 10 --seed $seed

exit

# tokenize

name=$seed

bash $PROJ/tokenize/encode.sh $name $lang

#preprocess

srun --gres=gpu:2080:1 -t 4:00:00 bash $PREP/preprocess_duo.sh $name $lang

#finetune

srun --gres=gpu:2080:1 -t 15:00:00 bash $TUNE/finetune.sh $name $lang


