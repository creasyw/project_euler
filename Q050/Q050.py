from prime import gen_prime

def main():
    ub = 1000000
    startpoint = 10
    primes = gen_prime(ub)
    result = []

    for start in range(startpoint):
        seq = primes[start:]
        count = 0
        total = 0
        for prime in seq:
            total += prime
            if total > ub:
                break
            count += 1
            if total in primes:
                if count > len(result):
                    result = seq[:count]
    print sum(result)

if __name__=="__main__":
    main()

