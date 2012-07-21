from math import factorial

def digit_factorial(n):
    return sum(factorial(int(k)) for k in str(n))

def num_round(n):
    count = 1
    while count <= 60:
        n = digit_factorial(n)
        count += 1
        if n == 145:
            return count
        elif n == 169 or n == 1454 or n == 363601:
            return count+2
        elif n == 871 or n == 872 or n == 45361 or n == 45362:
            return count+1
    return 0

def main():
    ub = 10**6
    count = 0
    filter = 60
    for i in range(3, ub):
        if num_round(i) == filter:
            count += 1
    print count

if __name__ == "__main__":
    main()

