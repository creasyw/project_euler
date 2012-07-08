from math import factorial

def is_curious(n):
    digits = str(n)
    sum = 0
    for i in digits:
        sum += factorial(int(i))
        if sum > n:
            return False
    if sum == n:
        return True
    else:
        return False

def main():
    ub = 999999
    result = []
    sum = 0
    for i in range(11, ub):
        if is_curious(i):
            result.append(i)
            sum += i
    print result
    print sum

if __name__=="__main__":
    main()

