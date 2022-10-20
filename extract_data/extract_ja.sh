#!/usr/bin/env bash

HOME=/home/jake
STAPLE=$HOME/repos/duolingo-sharedtask-2020
RAW=$HOME/corpora/staple
OUT=$HOME/projects/duo21/data/staple

conda activate duo21

for lang in ja ; do
#for lang in hu ja ko pt vi ; do
    for split in train dev test ; do
	    out=$OUT/$lang
	    mkdir -p $out
#	    mkdir -p $out/1best
#	    mkdir -p $out/all
#	    mkdir -p $out/2best
        mkdir -p $out/random

#	    python $STAPLE/get_traintest_data.py --fname $RAW/en_$lang/$split.en_$lang.2020-02-20.gold.txt --srcfname $out/1best/$split.en --tgtfname $out/1best/$split.$lang --prefix test 
#	    python $STAPLE/get_traintest_data.py --fname $RAW/en_$lang/$split.en_$lang.2020-02-20.gold.txt --srcfname $out/all/$split.en --tgtfname $out/all/$split.$lang --prefix train
	    python $STAPLE/get_traintest_data.py --fname $RAW/en_$lang/$split.en_$lang.2020-01-13.gold.txt --srcfname $out/random/$split.en --tgtfname $out/random/$split.$lang --prefix "random"

    done
done

	
