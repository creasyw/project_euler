
def generate_num(n):
    digits = ''
    for i in range(n):
        digits += str(i)
    return digits

def main():
    # For 1000000 digits at most, the concatenation will not achieve
    # the integer 200000.
    ub = 200000
    digits = generate_num(ub)
    result = 1
    for i in range(7):
        result = result*int(digits[pow(10,i)])
    print result

if __name__=="__main__":
    main()
