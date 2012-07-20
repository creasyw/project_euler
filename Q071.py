from fractions import Fraction

def main():
    ub = 10**6
    three_sevenths = 3.0 / 7
    step = 1./7/ub
    closest = Fraction(three_sevenths).limit_denominator(ub)

    while closest == Fraction(3, 7):
        three_sevenths -= step
        closest = Fraction(three_sevenths).limit_denominator(ub)
    print closest.numerator

if __name__ == "__main__": 
    main()
