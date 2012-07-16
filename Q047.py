from factor import prime_factors
import math

def factorize(n):
    if n < 1:
        raise ValueError('fact() argument should be >= 1')
    if n == 1:
        return []  # special case
    res = []
    # iterate over all even numbers first.
    while n % 2 == 0:
        res.append(2)
        n //= 2
    # try odd numbers up to sqrt(n)
    limit = math.sqrt(n+1)
    i = 3
    while i <= limit:
        if n % i == 0:
            res.append(i)
            n //= i
            limit = math.sqrt(n+i)
        else:
            i += 2
    if n != 1:
        res.append(n)
    return res

def distinct_prime_factors(n):
    return set(factorize(n))

def solution_2():
    chain = []
    search = 4
    for n in range(1,1000000):
        if len(distinct_prime_factors(n)) == search:
            chain.append(n)
    print (chain[i:i+search] for i, n in enumerate(chain) if chain[i:i+search] == range(n, n+search)).next()[0]

def solution_1():
    num = 647
    while True:
        if len(prime_factors(num))==4 and len(prime_factors(num+1))==4 and len(prime_factors(num+2))==4 and len(prime_factors(num+3))==4:
            break
        num += 1
    print num

if __name__=="__main__":
    solution_1()

