from math import log10
import os

def large_exponential(base, expo):
    return expo*log10(base)

def main():
    maximum = temp = count = 0
    with open(os.path.join(os.path.dirname(__file__), "base_exp.txt")) as datafile:
        for row in datafile:
            count += 1
            base, expo = (int(k) for k in row.split(','))
            result = large_exponential(base, expo)
            if temp < result:
                temp = result
                maximum = count
    print "The maximum exponential is in line ", maximum

if __name__ =="__main__":
    main()

