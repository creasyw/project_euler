from fractions import Fraction
from collections import Counter

def is_curious(numerator, denominatior):
    # According to Q033, "less than one in value"
    if numerator == denominatior:
        return False
    # Detect common element
    n = [k for k in str(numerator)]
    d = [k for k in str(denominatior)]
    c = list((Counter(n) & Counter(d)).elements())
    if not c:
        return False
    # Delete the common element and test if they are the right choices
    n.pop(n.index(c[0]))
    n = int(n[0])
    d.pop(d.index(c[0]))
    d = int(d[0])
    if d==0 or Fraction(n,d)!=Fraction(numerator,denominatior):
        return False
    else:
        return True

def main():
    result = []
    product = 1
    for i in range(11, 100):
        for j in range(i+1, 100):
            # Eliminate the trivial answers
            if i%10==0:
                continue
            if is_curious(i,j):
                result.append((i,j))
                product = product*Fraction(i,j)

    print result
    print product

if __name__ == "__main__":
    main()

