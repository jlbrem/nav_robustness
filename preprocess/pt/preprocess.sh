#!/bin/bash

HOME=/home/jake/projects/duo21
TEXT=$HOME/tokenize/pt/tatoeba
OUT=$HOME/preprocess/pt/tatoeba

conda activate duo21

fairseq-preprocess --source-lang pt --target-lang en \
	--trainpref $TEXT/train --validpref $TEXT/dev \
	--destdir $OUT \
	--workers 20
