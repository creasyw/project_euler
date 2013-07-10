from math import factorial

def combinatorics(n, r):
    return int(factorial(n)/factorial(r)/factorial(n-r))

def ncombinations(num, upperbound):
    # Fact: nCr==nC(n-r)
    middle = num/2
    count = 0
    for r in range(2,middle+1):
        if combinatorics(num, r) > upperbound:
            count += 2
    # for even number, the middle counts twice if it meets criterion.
    if num%2==0 and combinatorics(num, num/2)>upperbound:
        count -= 1
    return count

def main():
    result = 0
    ub = 1000000
    for n in range(2,101):
        result += ncombinations(n, ub)
    print result

if __name__=="__main__":
    main()

