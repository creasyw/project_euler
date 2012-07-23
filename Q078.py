# This question is very similar with Q076, but dynamic programming cannotwork here 
# since the explosion of number of combinations.In theory, this is about "partition" 
# in number theory: p(n) = p(n-1)+p(n-2)-p(n-5)-p(n-7)+p(n-12)+p(n-15)-p(n-22)-...,
# where p(0)=1 and p(k)=0 (k<0). the variable is generalized pentagonal numbers.
from itertools import cycle, takewhile, izip, count

def pentagonal(n):
    """
    Generalized pentagonal numbers (http://en.wikipedia.org/wiki/Pentagonal_number)
    """
    return n*(3*n-1)/2

def partition(n):
    """
    Calculate the next partition number in the list
    http://en.wikipedia.org/wiki/Partition_%28number_theory%29
    """
    if n<=1: return 1
    if n not in partitions:
        signs = cycle([1,1,-1,-1])
        pentagonals = takewhile( lambda p: p<=n, generalized_pentagonals)
        partitions[n] = sum(sign * partition(n-p) for sign, p in izip(signs, pentagonals))
    return partitions[n]

generalized_pentagonals = sorted(map(pentagonal, range(-250,250)))[1:]
partitions = {}

def main():
    print (n for n in count(0) if partition(n) % 1000000 == 0).next()

if __name__ == "__main__":
    main()
