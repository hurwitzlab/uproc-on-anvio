#!/usr/bin/env python

import argparse
from collections import defaultdict

if __name__ == "__main__":
    parser = \
    argparse.ArgumentParser(description="Script to count features.")
    parser.add_argument("-f", "--file", action="store", \
        help="File to count features from")
    parser.add_argument("-o1", "--out1", action="store", \
        help="Name for the id_to_feature file")
    parser.add_argument("-o2", "--out2", action="store", \
        help="Named for feature_to_count file")
    
    args = vars(parser.parse_args())

file_in = open(args["file"],"r")
file_out1 = open(args["out1"],"w")
file_out2 = open(args["out2"],"w")

id_to_feature={}
feature_to_count=defaultdict(int)

for line in file_in:
    line.rstrip('\n')
    if (',' in line):
        cols=line.split(',')
        #31,k99_351_1,1809,1,1,603,K03169,8.635 
        read_id=cols[1]
        feature=cols[6]
        id_to_feature.update({read_id:feature})
        feature_to_count[feature] += 1

for read_id in id_to_feature:
    file_out1.write(read_id + "\t" + id_to_feature[read_id] + "\n")

for feature in feature_to_count:
    file_out2.write(feature + "\t" + str(feature_to_count[feature]) + "\n")

file_in.close()
file_out1.close()
file_out2.close()
