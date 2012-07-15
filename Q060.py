# Here is the question that brutal force cannot work!
# itertools.combinations could enumerate all possible combinations without
# considering maybe the first several choices cannot meet the requirements
# already! So, the viable method is to do the selection by hand.

from prime import gen_prime, is_prime

def is_desired(primeset):
    already_test = primeset[:-1]
    prime = primeset[-1]
    for iter in already_test:
        if (not is_prime(int(str(iter)+str(prime)))) or (not is_prime(int(str(prime)+str(iter)))):
            return False
    return True

def main():
    primes = gen_prime(10000)
    found = False
    # any number concatenate 2 would generate even number.
    for first in range(1,len(primes)):
        for second in range(first+1,len(primes)):
            double = [primes[first], primes[second]]
            if not is_desired(double):
                continue
            for third in range(second+1, len(primes)):
                triple = double + [primes[third]]
                if not is_desired(triple):
                    continue
                for fourth in range(third+1, len(primes)):
                    quadruple = triple + [primes[fourth]]
                    if not is_desired(quadruple):
                        continue
                    for fifth in range(fourth+1, len(primes)):
                        pentuple = quadruple + [primes[fifth]]
                        if is_desired(pentuple):
                            print pentuple
                            print sum(pentuple)
                            return 0
    
    print "You need to enlarge the searching scope."

if __name__ == "__main__":
    main()
