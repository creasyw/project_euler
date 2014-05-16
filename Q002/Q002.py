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

