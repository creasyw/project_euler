#!/usr/bin/env python

from operator import mul
from fractions import gcd

def coprime(n):
    return [k for k in range(1,n) if gcd(n,k)==1]

def main():
    print max((float(n)/len(coprime(n)), n) for n in range(2, 1000001))[1]

if __name__ == "__main__":
    main()

