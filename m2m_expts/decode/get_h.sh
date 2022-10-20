#!/usr.bin.env bash

file=$1

grep "H-" $file | sort -V | cut -f3 | sed 's/^[ \t]*//'
