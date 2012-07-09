import sys

def prime(i, primes):
    for prime in primes:
        if not (i == prime or i % prime):
            return False
    primes.add(i)
    return True

def is_interesting(num, primes):
    # from left to right
    digits = str(num)
    if len(digits)==1:
        return False

    for i in range(1,len(digits)):
        if int(digits[i:]) not in primes:
            return False
    # from right to left
    for i in range(1,len(digits)):
        if int(digits[:i]) not in primes:
            return False
    return True
    
def main():
    primes = set([2])
    i, p = 2, 0
    
    count = 11
    result = []
    sum = 0
    while True:
        if prime(i, primes):
            if is_interesting(i, primes):
                result.append(i)
                sum += i
                p += 1
                sys.stdout.write("Find prime number %d\r"%(i))
                sys.stdout.flush()
            if p >= count:
                break
        i += 1
    
    print result
    print "Overall, finding through %d primes." % (len(primes))
    print "The sum is ", sum

if __name__=="__main__":
    main()

