
# For pentagonal, num = n(3n-1)/2 ==> n = (1+(1+24*num)**0.5)/6
def is_pentagonal(num):
    index = (1+(1+24*num)**0.5)/6
    if int(index) == index:
        return True
    else:
        return False

# For hexagonal, num = n(2n-1) ==> n = (1+(1+8*num)**0.5)/4
def is_hexagonal(num):
    index = (1+(1+8*num)**0.5)/4
    if int(index) == index:
        return True
    else:
        return False

def triangle(n):
    return n*(n+1)/2

def main():
    n = 286
    while True:
        base = triangle(n)
        if is_pentagonal(base) and is_hexagonal(base):
            break
        n += 1
    print n, triangle(n)

if __name__=="__main__":
    main()

