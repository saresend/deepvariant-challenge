import numpy as np 
import pandas as pd
import re 

END_REGEX = re.compile("\[[0-9]+\]")

df = { 'locus name': [], 
        'snp' : [],
        'chr id': [], 
        'chr position': [], 
        'coded allele': [], 
        'best trait': [], 
        'effect size of BT': [], 
        'coded allele freq': []}

def build_row(element_arr):
    # How do we want the data? 
    df['locus name'].append(element_arr[0])
    df['snp'].append(element_arr[1])
    df['chr id'].append(element_arr[2])
    df['chr position'].append(element_arr[3])
    df['coded allele'].append(element_arr[4])
    df['best trait'].append(element_arr[5])
    df['effect size of BT'].append(element_arr[6])
    df['coded allele freq'].append(element_arr[7])



def main():
    f = open("rando.txt", 'r')
    string_stream = f.read() 
    string_stream = string_stream.split() 
    construction_array = []
    index = 0
    while index < len(string_stream):
      
        if len(construction_array) < 8:
            if index + 3 < len(string_stream) and END_REGEX.match(string_stream[index + 3]) is not None:
                index += 4
                continue
            construction_array.append(string_stream[index])
            index += 1
        else:
            while END_REGEX.fullmatch(string_stream[index]) is None:
                index += 1
            # We've matched the end so we can 
            build_row(construction_array)
            construction_array = []
            index += 1
    print(len(df))
    data_frame = pd.DataFrame(df) 
    print(data_frame.head(100))
    csv_file = open("hypertension_markers.csv", 'w')
    csv_file.write(data_frame.to_csv(index=False))

main()
