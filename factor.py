def factorize(n):
    """ Provide factorization in a list """
    import math
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

def pull_off_factors(n, p, output_list):
    count = 0
    while True:
        if n % p == 0:
            count += 1
            n = n // p
        else:
            if count != 0:
                output_list.append((p, count))
            break
    return n


def prime_factors(n):
    output_list = []
    primes = [2,3,5,7,11,13,17,19,23,29]
    other_primes = [1,7,11,13,17,19,23,29]

    for p in primes:
        n = pull_off_factors(n, p, output_list)

    c = 0
    while True:
        top = n**0.5 + 1

        c += 30
        if c > top:
            if n != 1:
                output_list.append((n,1))
            return output_list
        for p in other_primes:
            n = pull_off_factors(n, c+p, output_list)

#def factors(n):
#    """ Provide all factors in a list """
#    factors = prime_factors(n)
#
#    all = [1]
#    for p,e in factors:
#        prev = all[:]
#        pn = 1
#        for i in range(e):
#            pn *= p
#            all.extend([a*pn for a in prev])        
#    all.sort()
#    return all

# a much concise version
def factors(n):
    return filter(lambda i: n % i == 0, range(1, n + 1))
