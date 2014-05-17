
import numpy as np
from functools import reduce

def compose(*functions):
    return reduce(lambda f, g: lambda x: f(g(x)), functions)

def fib_matrix(n):
    # basic matrix is [[1,1],[1,0]]
    x = np.ones((2,2), dtype=int)
    x[1,1] = 0
    times = n
    f1 = lambda i: np.dot(i, x)
    f2 = lambda i: np.dot(i, i)
    y = lambda i: i
    while times!=1:
        if times%2:
            y = compose(y, f1, f2)
        else:
            y = compose(y, f2)
        times /= 2
    return y(x)[0,0]

# calculate the nth Fibonacci number via Dynamic Programming
def fib(n):
    a = 0
    b = 1
    for _ in range(n):
        a, b = b, a+b
    return a

def main (limit):
    result = 0
    a = 0
    b = 1
    while True:
        a, b = b, a+b
        if a%2==0:
            result+=a
        if a>limit:
            break
    return result

if __name__ == "__main__":
    print main(4000000)

