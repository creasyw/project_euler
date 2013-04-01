import os
import sys
sys.path.append(os.path.abspath('..'))
import prime

def main():
    limit = 50000000
    a = int(limit**0.5)
    primes = prime.gen_prime(a)
    sumlst = set()

    for i in primes:
        for j in primes:
            sum = i**2+j**3
            if sum >= limit: break
            for k in primes:
                sum2 = sum+k**4
                if sum2 >= limit: break
                sumlst.add(sum2)
                #print i, j, k
    print "Q086 = ", len(sumlst)


if __name__=="__main__":
    main()



