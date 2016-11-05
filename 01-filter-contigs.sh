#!/usr/bin/env bash

#This script extracts fasta from anvi-contig.db with contigs greater than 2093

anvi-script-remove-short-contigs-from-fasta -l 500 -o contigs-longer-than-2093.fa final.contigs.fa
