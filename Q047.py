from factor import prime_factors

def main():
    num = 647
    while True:
        if len(prime_factors(num))==4 and len(prime_factors(num+1))==4 and len(prime_factors(num+2))==4 and len(prime_factors(num+3))==4:
            break
        num += 1
    print num

if __name__=="__main__":
    main()

