
def add_digits(num):
    return sum([int(k) for k in str(num)])

def main():
    result = 0
    for a in range(100):
        for b in range(100):
            dsum = add_digits(pow(a,b))
            if dsum > result:
                result = dsum
    print result

if __name__ == "__main__":
    main()

