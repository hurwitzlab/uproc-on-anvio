#!/usr/bin/env bash

source common.sh 
source config.sh

set -u
set -x

if [ -e $UPROC_DB_FILE ]; then
    while read UPROC_DB_NAME UPROC_DB; do

        INPUT="contigs-longer-than-2093.fa"

        UPROC_OUT="$UPROC_OUT_DIR/$UPROC_DB_NAME"
        OUTPUT_FILE="$UPROC_OUT/$(basename $INPUT ".fa-prodigal.fa").uproc"

        if [[ ! -d $UPROC_OUT ]]; then
            mkdir -p $UPROC_OUT
        fi

        if [[ -e $OUTPUT_FILE ]]; then
            rm -rf $OUTPUT_FILE
        fi

        $UPROC --preds \
            --threads 12 \
            --output $OUTPUT_FILE $UPROC_DB $UPROC_MODEL $INPUT
    done < "$UPROC_DB_FILE"
else
    echo "Cannot find UPROC_DB_FILE $UPROC_DB_FILE"
    exit 1
fi


