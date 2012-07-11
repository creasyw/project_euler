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

def factors(n):
    factors = prime_factors(n)

    all = [1]
    for p,e in factors:
        prev = all[:]
        pn = 1
        for i in range(e):
            pn *= p
            all.extend([a*pn for a in prev])        
    all.sort()
    return all
