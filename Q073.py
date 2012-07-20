from fractions import gcd

def main():
    print sum(1 for k in range(2,12001) for n in range(1,k) if n*3>k and n*2<k and gcd(n,k)==1)

if __name__ == "__main__":
    main()

