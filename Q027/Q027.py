import sys
from prime import gen_prime

def cal_formula(a, b):
    return lambda n: n**2+a*n+b

# initial set of prime
ub = 10000
primes = set(gen_prime(ub))

# initial state for the searching
ar, br = 1, 41
nprime = 40

for a in range(-999, 1000):
    for b in range(2, 1000):
        formula = cal_formula(a,b)
        n = 0
        while True:
            result = formula(n)
            if not result in primes:
                break
            else:
                n +=1
        if n > nprime:
            nprime = n
            ar = a
            br = b
    sys.stdout.write("Complete a = %d\r"%(a))
    sys.stdout.flush()

print "The final result is %d (a=%d, b=%d), finding %d primes" % (ar*br, ar, br, nprime)

