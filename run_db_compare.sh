#!/bin/bash

CONFIG="./config.sh"
COMMON="./common.sh"

if [ -e $CONFIG ]; then
  . "$CONFIG"
else
  echo Missing common \"$CONFIG\"
  exit 1
fi

if [ -e $COMMON ]; then
  . "$COMMON"
else
  echo Missing common \"$COMMON\"
  exit 1
fi

set -u
set -x

echo Started $(date)

echo Host $(hostname)
#
# Read the UPROC_DB_FILE and use each line to launch UPROC
#
if [ -e $UPROC_DB_FILE ]; then
    while read UPROC_DB_NAME UPROC_DB; do
        for FILE in $(cat down-list up-list); do
        
        INPUT="./Automatic-Binning/bin_by_bin/"$FILE"/"$FILE"-contigs.fa-prodigal.fa"

        UPROC_OUT="$UPROC_OUT_DIR/$UPROC_DB_NAME"
        OUTPUT_FILE="$UPROC_OUT/"$FILE".uproc"

        if [[ ! -d $UPROC_OUT ]]; then
            mkdir -p $UPROC_OUT
        fi

        if [[ -e $OUTPUT_FILE ]]; then
            rm -rf $OUTPUT_FILE
        fi

        echo Running $(basename $UPROC) on \"$FILE\" using this db: \"$UPROC_DB_NAME\"

        $UPROC --preds \
            --threads 12\
            --output $OUTPUT_FILE $UPROC_DB $UPROC_MODEL $INPUT

        done
    done < "$UPROC_DB_FILE"
else
    echo "Cannot find UPROC_DB_FILE $UPROC_DB_FILE"
    exit 1
fi

echo Finished $(date)
