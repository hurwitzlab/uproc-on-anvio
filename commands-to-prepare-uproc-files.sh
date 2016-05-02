#!/usr/bin/env bash

for thing in $(cat up-list); do cp $KEGGOUT/"$thing".uproc $KEGGOUT/up."$thing".uproc; done

for thing in $(cat down-list); do cp $KEGGOUT/"$thing".uproc $KEGGOUT/down."$thing".uproc; done

find $KEGGOUT -iname \*down.Bin\* -print0 | xargs -0 -I file cat file > $KEGGOUT/all-down.uproc

find $KEGGOUT -iname \*up.Bin\* -print0 | xargs -0 -I file cat file > $KEGGOUT/all-up.uproc


