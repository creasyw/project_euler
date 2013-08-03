from fractions import Fraction as fraction

def one_round(a, frac):
    return a+1/frac

def gen_e_constant(n):
    e = [2]
    for i in range(n-1):
        if i%3 == 1:
            e.append(2*(i/3+1))
        else:
            e.append(1)
    return e

def main():
    e = gen_e_constant(100)
    result = fraction(e[len(e)-1], 1)
    for iter in range(len(e)-2, -1, -1):
        result = one_round(e[iter], result)
    print sum([int(k) for k in str(result.numerator)])

if __name__=="__main__":
    main()
