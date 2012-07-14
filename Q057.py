# The question could reduce to a tail-recursion:
# n1 = 1+ 1/2, n2 = 1+1/(1+n1), .. , n(n) = 1+1/(1+n(n-1))

from fractions import Fraction as fraction

def sr_deduction(pre):
    return 1+1/(1+pre)

def is_longer(num):
    nu = num.numerator
    de = num.denominator
    if len(str(nu)) > len(str(de)):
        return True
    else:
        return False

def main():
    round = 1000
    count = 0
    num = fraction(3,2)

    for i in range(1,round):
        num = sr_deduction(num)
        if is_longer(num):
            count += 1
    print count

def solution_2():
    nu, de, count = 3, 2, 0
    for i in range(1,1000):
        nu, de = nu+de+de, nu+de
        if len(str(nu)) > len(str(de)):
            count +=1
    print count 

if __name__ == "__main__":
    #main()
    solution_2()

