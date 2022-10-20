#!/usr/bin/env bash

fairseq=~/fairseq
m2m=~/models/m2m
data=~/projects/duo21/synthetic/prepped
proj=~/projects/duo21/synthetic
save=$proj/finetune/multi

mkdir -p $save

lang=multi

conda activate duo21

lang_pairs=hu-en,ja-en,pt-en
path_2_data=$proj/prepped/$lang
lang_list=$m2m/language_pairs_small_models.txt
pretrained_model=$m2m/1.2B_last_checkpoint.pt

fairseq-train $path_2_data \
  --finetune-from-model $pretrained_model --save-dir $save \
  --task translation_multi_simple_epoch --encoder-normalize-before \
  --langs 'af,am,ar,ast,az,ba,be,bg,bn,br,bs,ca,ceb,cs,cy,da,de,el,en,es,et,fa,ff,fi,fr,fy,ga,gd,gl,gu,ha,he,hi,hr,ht,hu,hy,id,ig,ilo,is,it,ja,jv,ka,kk,km,kn,ko,lb,lg,ln,lo,lt,lv,mg,mk,ml,mn,mr,ms,my,ne,nl,no,ns,oc,or,pa,pl,ps,pt,ro,ru,sd,si,sk,sl,so,sq,sr,ss,su,sv,sw,ta,th,tl,tn,tr,uk,ur,uz,vi,wo,xh,yi,yo,zh,zu' \
  --lang-pairs $lang_pairs --max-tokens 1200 --decoder-normalize-before --sampling-method temperature \
  --sampling-temperature 1.5 --encoder-langtok src --decoder-langtok --criterion label_smoothed_cross_entropy \
  --label-smoothing 0.2 --optimizer adam --adam-eps 1e-06 --adam-betas '(0.9, 0.98)' \
  --lr-scheduler inverse_sqrt --lr 3e-05 --warmup-updates 2500 --max-update 40000 --dropout 0.3 \
  --attention-dropout 0.1 --weight-decay 0.0 --update-freq 2 --save-interval 1 --save-interval-updates 5000 \
  --no-epoch-checkpoints --seed 222 --log-format simple --log-interval 2 --patience 10 \
  --arch transformer_wmt_en_de_big --encoder-layers 24 --decoder-layers 24 --encoder-ffn-embed-dim 8192 \
  --decoder-ffn-embed-dim 8192 --encoder-layerdrop 0.05 --decoder-layerdrop 0.05 --share-decoder-input-output-embed \
  --share-all-embeddings --ddp-backend no_c10d
