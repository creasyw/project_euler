#from fractions import Fraction
#from decimal import getcontext, Decimal

#getcontext().prec = 100

# This solution is inspired by one previous puzzle,
# but its performance is not good enough...
def sqrt_continued_fraction(x, y, limit):
    den = Fraction(2*x,1)
    round = 0
    result = y/den
    while round <= limit:
        result = y/(2*x+result)
        round += 1
    return x+Decimal(result.numerator)/Decimal(result.denominator)

def sqrt_appr(n, digits):
    # Take account for the inaccurate digits
    limit = 10**(digits+1)
    a = 5*n
    b = 5
    while b < limit:
        if a >= b:
            a -= b
            b += 10
        else:
            a *= 100
            b = b/10*100+5
    # The last two digits are not accurate
    return str(b)[:-2]

def generate_nums(limit):
    result = range(limit+1)
    for k in range(2, int(limit**0.5)+1):
        result[k**2] = None
    return [i for i in result[2:] if i]

def main():
    candidates = generate_nums(100)
    result = 0
    for i in candidates:
        result += sum(int(k) for k in sqrt_appr(i, 100))
    print result

if __name__ == "__main__":
    main()
