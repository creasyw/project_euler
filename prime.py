# This script compares three means to generate the first x primes,
# in which "historic" is fastest and "regexp" is slowest.
from sys import argv
from time import time

def prime(i, primes):
    for prime in primes:
        if not (i == prime or i % prime):
            return False
    primes.add(i)
    return i

def historic(n):
    primes = set([2])
    i, p = 2, 0
    while True:
        if prime(i, primes):
            p += 1
            if p == n:
                return primes
        i += 1

# if we only need generator primes in a given range, the in-place
# operations are far more efficient than comparing-and-adding
# recursively. e.g. generate primes under 1000000:
# "historic" needs more than 1m, "gen_prime" only needs 1s.
def gen_prime(n):
    candidates = range(n+1)
    fin = int(n**0.5)
    for i in xrange(2,fin+1):
        if not candidates[i]:
            continue
        candidates[2*i::i] = [None]*(n//i-1)
    return [i for i in candidates[2:] if i]

def naive(n):
    from itertools import count, islice
    primes = (n for n in count(2) if all(n % d for d in range(2, n)))
    return islice(primes, 0, n)

def isPrime(n):
    import re
    # see http://tinyurl.com/3dbhjv
    return re.match(r'^1?$|^(11+?)\1+$', '1' * n) == None

def regexp(n):
    import sys
    N = int(sys.argv[1]) # number of primes wanted (from command-line)
    M = 100              # upper-bound of search space
    l = list()           # result list

    while len(l) < N:
        l += filter(isPrime, range(M - 100, M)) # append prime element of [M - 100, M] to l
        M += 100                                # increment upper-bound

    return l[:N] # print result list limited to N elements

def dotime(func, n):
    print func.__name__
    start = time()
    print sorted(list(func(n)))
    print 'Time in seconds: ' + str(time() - start)

if __name__ == "__main__":
    for func in naive, historic, regexp:
        dotime(func, int(argv[1]))
