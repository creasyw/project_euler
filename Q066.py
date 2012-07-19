# This question could refer to Pell's Equation. See reference at Wikipedia,
# MathWorld http://mathworld.wolfram.com/PellEquation.html,
# research paper http://www.jpr2718.org/pell.pdf,
# or http://www.math.niu.edu/~rusin/known-math/98/sq_tri.

# It is amazing that Q064 and Q065 are the elementary steps for it!!!
# SOLUTION: num = "the length of continued fraction of D^.5"
#           pool = list( recurence formula to approximate D^/5)
# ==> fraction(a, b) = "num"th element in pool
# ==> a^2 - Db^2 = 1 and (a.b) is the smallest non-trivial solution
# (http://www.mathisfunforum.com/viewtopic.php?id=12436)

from fractions import Fraction as fraction
from math import sqrt
from Q064 import notation
from Q065 import one_round

def cal_faction(sequence, extend):
    sequence += extend
    length = len(extend)
    nround = length-1
    frac = fraction(sequence[length-1], 1)
    for i in range(nround):
        frac = one_round(sequence[length-2-i], frac)
    return frac

def smallest_pell(d):
    sequence = [int(sqrt(d))]
    extend = notation(d)
    frac = cal_faction(sequence, extend)
    if frac.numerator**2-d*frac.denominator**2 == -1:
        return cal_faction(sequence, extend+extend)
    else:
        return frac

def main():
    dlargest = 5
    xlargest = 9
    for d in range(2,1001):
        if sqrt(d) == int(sqrt(d)):
            continue
        frac = smallest_pell(d)
        if  frac.numerator > xlargest:
            xlargest = frac.numerator
            dlargest = d
    print dlargest

if __name__ == "__main__":
    main()



