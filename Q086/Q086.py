from Q075 import pythagorean
from collections import defaultdict, OrderedDict
from math import pow, ceil

def arr_result(m, pytha):
    count = 0
    for entry in pytha.values():
        c1, c2, _ = entry[0]
        for i in xrange(int(ceil(c2/2.)), c2):
            if c1 > m or i > c1: break
            #print sorted((i, c2-i, c1))
            count +=1
        for j in xrange(int(ceil(c1/2.)), c1):
            if c2 > m or j > c2: break
            #print sorted((j, c1-j, c2))
            count +=1
    return count

def main():
    m = 24
    perimeter_limit = int(ceil(3*m+(5*m**2)**0.5))
    pytha = pythagorean(perimeter_limit)
    count = arr_result(m,pytha)
    print count

if __name__ == "__main__":
    main()

