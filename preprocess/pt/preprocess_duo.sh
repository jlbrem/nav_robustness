#!/bin/bash

cond=$1
lang=$2

HOME=/home/jake/projects/duo21
TEXT=$HOME/tokenize/$lang/duo/$cond #change
OUT=$HOME/preprocess/$lang/duo/$cond #change

conda activate duo21

fairseq-preprocess --source-lang $lang --target-lang en \
	--trainpref $TEXT/train --validpref $TEXT/dev --testpref $TEXT/test \
	--srcdict $HOME/preprocess/$lang/dict.$lang.txt \
	--tgtdict $HOME/preprocess/$lang/dict.en.txt \
	--destdir $OUT \
	--workers 20
