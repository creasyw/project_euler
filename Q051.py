# The essense of this algorithm comes from Zach Denton
# http://zacharydenton.com/project-euler-solutions/51/
from prime import gen_prime, is_prime
from itertools import product
import sys

def number_families(num):
    digits = [d for d in str(num)]
    # test all possible combinations except replacing nothing
    products = list(product((True, False), repeat=len(digits)))[1:-1]
    for p in products:
        pattern = ''
        for i, x in enumerate(p):
            if x:
                pattern += digits[i]
            else:
                pattern += 'X'
        yield [int(pattern.replace('X', str(n))) for n in range(10)]

def main():
    upperbound = 1000000
    for prime in gen_prime(upperbound):
        for number_family in number_families(prime):
            prime_family = [n for n in number_family if is_prime(n) and len(str(n))==len(str(prime))]
            if len(prime_family)==8 and prime in prime_family:
                print '\n',prime
                return
        sys.stdout.write("Testing number %d\r"%(prime))
        sys.stdout.flush()

if __name__=="__main__":
    main()
