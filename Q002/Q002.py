
fab = lambda x, y: x+y

def main (limit):
    result = 2
    a = 1
    b = 2
    for i in range(3, limit+1):
        c = fab(a, b)
        a = b
        b = c
        if c%2 == 0: result += c
    print result

if __name__ == "__main__":
    main(4000000)

