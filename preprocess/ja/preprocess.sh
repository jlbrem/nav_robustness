#!/bin/bash

HOME=/home/jake/projects/duo21
TEXT=$HOME/tokenize
OUT=$HOME/preprocess

conda activate duo21

fairseq-preprocess --source-lang ja --target-lang en \
	--trainpref $TEXT/train --validpref $TEXT/valid \
	--destdir $OUT \
	--workers 20
