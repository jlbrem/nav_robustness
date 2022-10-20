#!/bin/bash

HOME=/home/jake/projects/duo21

lang=$1

TEXT=$HOME/tokenize/$lang/tatoeba
OUT=$HOME/preprocess/$lang/tatoeba

conda activate duo21

fairseq-preprocess --source-lang $lang --target-lang en \
	--trainpref $TEXT/train --validpref $TEXT/dev \
	--destdir $OUT \
	--workers 20
