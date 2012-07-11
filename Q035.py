import sys
from prime import gen_prime

# This function is from stackoverflow http://bit.ly/RoBoF.
# The better choice is to use itertools.permutations().
def all_perms(elements):
    if len(elements)<=1:
        yield elements
    else:
        for perm in all_perms(elements[1:]):
            for i in range(len(elements)):
                yield perm[:i] + elements[0:1] + perm[i:]

# According to the Q035, it asks for the rotation rather than
# permutation of the numbers.
def all_rotations(elements):
    for i in range(len(elements)):
        yield elements[i:]+elements[:i]

def is_circular(n, primes):
    digits = [k for k in str(n)]
    permutations = all_rotations(digits)
    #permutations = all_perms(digits)
    for i in permutations:
        num = int(''.join(i))
        if num not in primes:
            return False
    return True

def main():
    # initial set of prime
    primes = set([2])
    ub = 1000000
    primes = gen_prime(ub)
    print "The length of the primes is ", len(primes)

    result = []
    for i in primes:
        if is_circular(i, primes):
            result.append(i)
        sys.stdout.write("Complete %d\r" % (i))
        sys.stdout.flush()

    print result
    print len(result)

if __name__=="__main__":
    main()

