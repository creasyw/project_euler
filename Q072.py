from Q069 import totient 

def main():
    ub = 10**6
    print int(sum(totient(k) for k in range(2,ub+1)))

if __name__ == "__main__":
    main()
