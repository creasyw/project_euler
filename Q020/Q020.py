from functools import reduce

def factorial (x):
    return reduce(lambda acc, x: acc * x, range(2, x+1), 1)

def sum_digits(x):
    return sum(int(k) for k in str(factorial(x)))
