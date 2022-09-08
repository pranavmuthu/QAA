# Author: <PRANAV MUTHURAMAN> <pmuthura@uoregon.edu>

# Check out some Python module resources:
#   - https://docs.python.org/3/tutorial/modules.html
#   - https://python101.pythonlibrary.org/chapter36_creating_modules_and_packages.html
#   - and many more: https://www.google.com/search?q=how+to+write+a+python+module


'''This module is a collection of useful bioinformatics functions
written during the Bioinformatics and Genomics Program coursework.
__version__ = "0.5"         # Read way more about versioning here:
                            # https://en.wikipedia.org/wiki/Software_versioning
                            '''

DNA_bases = "ACTGN"
RNA_bases = "ACUGN"

def convert_phred(letter: str) -> int:
    '''
    This function takes a ASCII value representing the Quality score and converts it to the decimal value - 33 (Phred 33)
    Input: A
    Expected output: 32
    parameter: string score
    return: int decimal_score
    '''
    dec = ord(letter)
    decimal_score = dec - 33

    return decimal_score


def qual_score(phred_letter):
    '''
    This function take a quality string and returns the average quality score of that line
    Input: AAAIII
    Expected output: 36
    parameter: string qual_line
    return: float avg_qual
    ''' 

    qual_list = list()

    for i in phred_letter:
        qual_list.append(convert_phred(i))

    average = 0
    
    for i in qual_list:
        average += int(i)

    return (average/len(qual_list))


def contain_N(index: str) -> int:
    '''
    This function takes a string of 2 indexes seperated with a '-' and returns the number of Ns it contains
    Input: AACTTGCC-ANCTNGCC
    Expected output: 2
    parameter: string index
    return: int num_ns
    '''
    num_ns = 0
    for char in index:
        if char.upper() == "N":
            num_ns += 1
    
    return num_ns

def if_match(index: str) -> bool:
    '''
    This function takes a string of 2 indexes seperated with a '-' and returns True if they match and False is they are different 
    Input: AACTTGCC-AACTTGCC
    Expected output: True
    parameter: string index
    return: bool match_flag
    '''
    index1 = index[0:7]
    index2 = index[9:16]
    if index1 == index2:
        return True
    else:
        return False

def reverse_comp(index: str) -> str:
    '''
    This function takes a string of 1 index and returns a string of the reverse complement 
    Input: AACTTGCC
    Expected output: GGCAAGTT
    parameter: string index
    return: string rev_comp
    '''
    reverse = index[::-1]
    complements = {'A': 'T', 'C': 'G', 'T': 'A', 'G': 'C', 'N': 'N'}
    rc = ''
    for base in reverse:
        rc = str(rc + complements[base])
    
    return rc

    
def validate_base_seq(seq: str,RNAflag: bool = False) -> bool:
    
   
    '''This function takes a string. Returns True if string is composed
    of only As, Ts (or Us if RNAflag), Gs, Cs. False otherwise. Case insensitive.'''
    DNAbases = set('ATGCatcg')
    RNAbases = set('AUGCaucg')

    return set(seq) <= (RNAbases if RNAflag else DNAbases)


def gc_content(DNA: str) -> int:
    '''Takes DNA (or RNA) sequence and returns GC content of the sequence in decimal format as a fraction of 1.'''
    GC_count = 0
    if validate_base_seq(DNA):
        DNA = DNA.upper()
        for letter in DNA:
            if letter == 'G' or letter == 'C':
                GC_count += 1
    else:
        print('Not a valid sequence')
    return GC_count/len(DNA)


def oneline_fasta (self):
    '''Reads through the fasta file and return the header and sequences for each record.'''
    header = ''
    sequence = ''
        
    with open(self.fname) as fh:
        header = ''
        sequence = ''
 
        # Read the First Line and Append header
        line = fh.readline()
        header = line[1:].rstrip()

        # Read the next line continuous and add up the squences until the next header is reach
        # If so return the header and sequence
        for line in fh:
            if line.startswith ('>'):
                yield header,sequence
                header = line[1:].rstrip()      # The next header
                sequence = ''                   # Clear Sequence 
            else :
                sequence += ''.join(line.rstrip().split()).upper()
                    
    yield header,sequence


if __name__ == "__main__":
    assert (convert_phred('A')) == 32, 'Wrong phred score'
    print('Phred Score Conversion Correct')
    
    assert (qual_score('AAAIII')) == 36, 'Wrong average quality score'
    print('Average Quality Score Correct')
    
    assert validate_base_seq("ACTGATA") == True, "Validate base seq does not work on DNA"
    assert validate_base_seq("AGUAUCA", True) == True, "Validate base seq does not work on RNA"
    assert validate_base_seq("Random String") == False, "Validate base seq fails to recognize nonDNA"
    print("Validate Base Seq Correct")
    
    assert gc_content('GCAGCGTTAA') == 0.5, 'gc_content does not find correct GC content'
    print('GC Content Correct')