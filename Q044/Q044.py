from itertools import combinations
from operator import add, sub

def pentagonal(n):
    return n*(3*n-1)/2

def main():
    pentagonals = set(pentagonal(k) for k in range(1,3000))
    c = combinations(pentagonals,2)
    smallest = 10000000
    result = []
    for p in c:
        if add(*p) in pentagonals and abs(sub(*p)) in pentagonals:
            difference = abs(sub(*p))
            if difference < smallest:
                smallest = difference
                result = p
    print result
    print smallest

if __name__=="__main__":
    main()
