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


def prime_concat (a, b):
    return is_prime(int(str(a)+str(b))) and is_prime(int(str(b)+str(a)))

def main():
    primes = gen_prime(10000)
    # any number concatenate 2 would generate even number.
    for first in range(1,len(primes)):
        for second in range(first+1,len(primes)):
            if not prime_concat(primes[first], primes[second]):
                continue
            temp = [primes[first], primes[second]]
            for third in range(second+1, len(primes)):
                if not all([prime_concat(k, primes[third]) for k in temp]):
                    continue
                temp.append(primes[third])
                for fourth in range(third+1, len(primes)):
                    if not all([prime_concat(primes[fourth], k) for k in temp]):
                        continue
                    temp.append(primes[fourth])
                    for fifth in range(fourth+1, len(primes)):
                        if all([prime_concat(primes[fifth], k) for k in temp]):
                            temp.append(primes[fifth])
                            print temp
                            print sum(temp)
                            return 0
    
    print "You need to enlarge the searching scope."

# In the same testing environment, sol1 ~ 15s, while sol2 ~ 0.7s, both using pypy
# 1st one is a "deep-first" search
# 2nd one is operating intermediate results based on certain predicates
# in which first of all finding pairs of suitable primes, and then trying to 
# extend the suitable pairs as long as possible.
# the algo. terminates at the first time that there are five elements in a group


import sys
def solve(lst):
    for i in range(len(lst)):
        templist = []
        last1 = lst[i][-1]
        for j in range(i+1,len(lst)):
            last2 = lst[j][-1]
            if prime_concat(last1, last2):
                templist.append(list(lst[i])+[last2])
                if len(templist[-1]) == 5:
                    print templist[-1]
                    print sum(templist[-1])
                    sys.exit(0)
        solve(templist)

def solution2():
    primes = gen_prime(10000)
    for i in range(1,len(primes)):
        lst = []
        for j in range(i+1, len(primes)):
            if prime_concat(primes[i], primes[j]):
                lst.append([primes[i],primes[j]])
        solve(lst)

if __name__ == "__main__":
    #main()
    solution2()
