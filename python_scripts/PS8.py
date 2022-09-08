#!/usr/bin/env python
'''
PS8.py
'''

import sys
'''
Read through the sam file and create of list of reads 
This code assume that all reads with the same names have the same flag (map/unmap reads)

Usage: 
python3 PS8.py <file.sam> > count_reads_map_notmap.txt 
'''
def parseHeader(file):
    fin = open(file, 'r')
    lines = fin.readlines()
    reads_dict = dict()
    for count, line in enumerate(lines):
        if line.startswith ('@'):
            pass
        else:
            read_split = line.split('\t')
            flag = read_split[1]
            name = read_split[0]
            name = name + str(count)
            reads_dict[name] = flag
    return reads_dict

'''
Check if current read is map
Given bitwise flag
'''
def mapCheck(flag):
    mapped = False
    if((flag & 4) != 4):
      mapped = True
    return mapped

def checkPrimary(flag):  
    primary = False  
    if((flag & 256) == 256):
      primary = True
    return primary

'''
Return number of mapped and unmapped reads
'''
def mapCount(reads_dict):
    numMapped = 0
    numUnmmaped = 0

    for name, flag in reads_dict.items():

        if checkPrimary(int(flag)):
            continue
        if mapCheck(int(flag)):
            numMapped += 1
        else:
            numUnmmaped += 1
    return numMapped, numUnmmaped

'''
Main Function
'''
def main():
    samfile = sys.argv[1]
    reads_dict = parseHeader(samfile) 
    #pprint.pprint(reads_dict)
    numMapped, numUnmmaped = mapCount(reads_dict)
    Total = numMapped + numUnmmaped
    print('Total: {}'.format(Total))
    print('Number of Mapped Reads: {}, Number of Unmapped Reads {}'.format(numMapped, numUnmmaped))

if __name__ == "__main__":
	main()
