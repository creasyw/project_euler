from prime import gen_prime
from itertools import combinations
from math import sqrt

def is_permutation(a ,b):
    return sorted(str(a)) == sorted(str(b))

def main():
    ub = 10**7
    pairs = combinations(gen_prime(2*int(sqrt(ub))), 2)
    result = (87109./79180, 87109)
    # Becasue primes produce most relative primes, but single prime doesn't
    # meet the "permutation" criterion. Hence, directly looking up to the 
    # product of two primes
    for product, phi in ((a*b, (a-1)*(b-1)) for a,b in pairs if a*b<ub):
        if is_permutation(phi, product):
            r = float(product)/phi
            if r < result[0]:
                result = (r, product)
    print result
if __name__ == "__main__":
    main()

