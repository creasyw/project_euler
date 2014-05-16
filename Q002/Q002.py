
fib = lambda x, y: x+y

def main (limit):
    result = 2
    a = 1
    b = 2
    for i in range(3, limit+1):
        c = fib(a, b)
        a = b
        b = c
        if c%2 == 0: result += c
    print result

def sol2(limit):
    # without tail recursion, this method would exhaust ram..
    fabs = [1,1]
    [fabs.append(fabs[-1]+fabs[-2]) for i in range(limit)]
    print sum(filter(lambda x: x%2==0, fabs))

if __name__ == "__main__":
    main(4000000)

