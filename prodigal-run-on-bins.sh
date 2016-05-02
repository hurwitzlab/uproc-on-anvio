#!/usr/bin/env bash

set -u #exit if undeclared variable
set -x #echo everything

for FILE in $(cat up-list down-list); do
    INPUT=$(find ./Automatic-Binning/bin_by_bin/ -iname $FILE-contigs.fa)
    
    prodigal -d "$INPUT"-prodigal.fa -o "$INPUT"-prodigal.gbk -i $INPUT

done


