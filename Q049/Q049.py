from prime import gen_prime
from permutation import next_permutation

def main():
    primes = gen_prime(10000)
    pool = [k for k in primes if k>1000]
    result = []
    for num in pool:
        if num in result:
            continue
        perms = next_permutation([k for k in str(num)])
        count = 0
        temp = []
        for perm in perms:
            if int(''.join(perm)) in pool:
                count += 1
                temp.append(int(''.join(perm)))
        if count >= 3:
            temp.sort()
            if temp[2]-temp[1]==temp[1]-temp[0]:
                result += temp
    print result

if __name__=="__main__":
    main()
