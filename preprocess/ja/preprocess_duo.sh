#!/bin/bash

cond=$1

HOME=/home/jake/projects/duo21
TEXT=$HOME/tokenize/duo/$cond #change
OUT=$HOME/preprocess/duo/$cond #change

conda activate duo21

fairseq-preprocess --source-lang ja --target-lang en \
	--trainpref $TEXT/train --validpref $TEXT/dev --testpref $TEXT/test \
	--srcdict $HOME/preprocess/dict.ja.txt \
	--tgtdict $HOME/preprocess/dict.en.txt \
	--destdir $OUT \
	--workers 20
