import sys

def prime(i, primes):
    for prime in primes:
        if not (i == prime or i % prime):
            return False
    primes.add(i)
    return True

def historic(n, primes):
    i = max(primes)
    while True:
        if prime(i, primes):
            if i >= n:
                return primes
        i += 1

def cal_formula(a, b):
    return lambda n: n**2+a*n+b

# initial set of prime
primes = set([2])
ub = 7919
primes = historic(ub, primes)

# initial state for the searching
ar, br = 1, 41
nprime = 40

for a in range(-999, 1000):
    for b in range(2, 1000):
        formula = cal_formula(a,b)
        n = 0
        while True:
            result = formula(n)
            if result>ub:
                primes = historic(result, primes)
                ub = max(primes)
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

