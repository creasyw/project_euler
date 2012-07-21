#!/usr/bin/env python

import math
from operator import mul
from factor import factorize

def totient(n):
    return n * reduce(mul, [1 - (1.0 / p) for p in set(factorize(n))])

def main():
    print max((n / totient(n), n) for n in range(2, 1000001))[1]

if __name__ == "__main__":
    main()

