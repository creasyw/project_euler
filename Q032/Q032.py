
def is_pandigital(a, b, c, length):
    num = sorted(str(a)+str(b)+str(c))
    if len(num) != length:
        return False
    for i in range(len(num)):
        if str(i+1)!=num[i]:
            return False

    return True

def main():
    pand = set()
    total = 0
    length = 9
    for i in range(1,5000):
        for j in range(1,100):
            product = i*j
            if is_pandigital(i, j, product, length):
                pand.add(product)
                total +=1
    
    print sum(pand), total

if __name__ == "__main__":
    main()

