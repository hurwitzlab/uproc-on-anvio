#Change CWD to wherever put the repo
export CWD="/gsfs1/rsgrps/bhurwitz/scottdaniel/megahit_output_dedup"
export REF="/rsgrps/bhurwitz/hurwitzlab/data/reference"
#
#
export DAT="$CWD"
export BIN_DIR="/rsgrps/bhurwitz/hurwitzlab/bin"

export UPROC="$BIN_DIR/uproc-dna"
export UPROC_MODEL="$REF/uproc/model"
export UPROC_OUT_DIR="$DAT/uproc-out"
export UPROC_DB_FILE="$DAT/uproc_dbs"
export UPROC_KEGG_OUT="$UPROC_OUT_DIR/uproc_kegg"
export UPROC_PFAM_OUT="$UPROC_OUT_DIR/uproc_pfam"
export UPROC_ID2FEATURE="$DAT/feature-out"
export UPROC_FEATSUM="$DAT/feature-sums"

function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
