#!/usr/bin/env bash

#along with a little modificaiton to python script if ',' =~ line
#instead of if ':' =~ line

#./get_id2feature.py -f /gsfs1/rsgrps/bhurwitz/scottdaniel/megahit_output/uproc-out/uproc_kegg/all -o1 $KEGGOUT/contigs.id_to_feature -o2 $KEGGOUT/contigs.feature_to_count

./get_id2feature.py -f /gsfs1/rsgrps/bhurwitz/scottdaniel/megahit_output/uproc-out/uproc_kegg/all-down.uproc -o1 $KEGGOUT/all-down.id_to_feature -o2 $KEGGOUT/all-down.feature_to_count

./get_id2feature.py -f /gsfs1/rsgrps/bhurwitz/scottdaniel/megahit_output/uproc-out/uproc_kegg/all-up.uproc -o1 $KEGGOUT/all-up.id_to_feature -o2 $KEGGOUT/all-up.feature_to_count


