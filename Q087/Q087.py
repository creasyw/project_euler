import os
import sys
sys.path.append(os.path.abspath('..'))
import prime
# product is impractical because of too many unnecessary calculation
#from itertools import product

def main():
    limit = 50000000
    primes = prime.gen_prime(int(limit**0.5))
    result = set()

    for i in primes:
        for j in primes:
            sum = i**2+j**3
            if sum >= limit: break
            for k in primes:
                sum2 = sum+k**4
                if sum2 < limit:
                    result.add(sum2)
    print "Q086 = ", len(result)


if __name__=="__main__":
    main()



