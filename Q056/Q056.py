
def add_digits(num):
    return sum([int(k) for k in str(num)])

def main():
    print max([add_digits(a**b) for a in range(2,100) for b in range(1,100)])

if __name__ == "__main__":
    main()

