import os
import re

rdict = {'I':1, 'V':5, 'X':10, 'L':50, 'C':100, 'D':500, 'M':1000}
sub_pair = {'IV':4, 'IX':9, 'XL':40, 'XC':90, 'CD':400, 'CM':900}

def value (roman):
    num = rdict[roman[0]]
    for i in range(1, len(roman)):
        num += rdict[roman[i]]
        if roman[i-1:i+1] in sub_pair:
            num -= 2*rdict[roman[i-1]]
    return num

def is_minimal (roman):
    if len(roman) < 4:
        return True
    for i in range(3, len(roman)):
        pair = roman[i]+roman[min(i+1,len(roman)-1)]
        if pair in sub_pair:
            continue
        tested = roman[:i+1]
        if value(tested) in rdict.values():
            return False
        for i in range(len(tested)-4, -1, -1):
            if value(tested[i:]) in sub_pair.values():
                return False
    return True

def testing ():
    print "The final result: ",  is_minimal('IIIIIIIIIIIIIIII') == False
    print "The final result: ",  is_minimal('XVI') == True
    print "The final result: ",  is_minimal('XXXXIX') == False
    print "The final result: ",  is_minimal('XXXXIIIIIIIII') == False
    print "The final result: ",  is_minimal('XXXXVIIII') == False
    print "The final result: ",  is_minimal('XLVIIII') == False
    print "The final result: ",  is_minimal('XLIX') == True
    print "The final result: ",  is_minimal('XLXLXLXLXLXLXLXLXLXL') == False # CD



def main():
    count = 0
    with open(os.path.join(os.path.dirname(__file__), 'roman.txt')) as datafile:
        for row in datafile:
            if is_minimal(re.sub("\n", "", row)):
                count += 1
    print count

if __name__ == "__main__":
    main()


