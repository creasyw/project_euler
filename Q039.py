# For right angle triangle, the relationship between perimeter p and two
# right sides x, y is y = (p^2-2*x*p)/(2*(p-x))
from math import sqrt
import sys

def is_integer(p, x):
    y = (pow(p,2)-2*x*p)/(2*(p-x))
    hypotenuse = sqrt(pow(x,2)+pow(y,2))
    if int(hypotenuse)==hypotenuse:
        return True
    else:
        return False

def main():
    ub = 1001
    result = 0
    cmax = 0
    for p in range(1,ub):
        count = 0
        # Assume x <= y
        xmax = int(p/(2+sqrt(2)))
        for x in range(1,xmax):
            if is_integer(p, x):
                count +=1
        if count >cmax:
            cmax = count
            result = p
            sys.stdout.write("Current max num is %d for %d\r"%(cmax,p))
            sys.stdout.flush()

    print "\n", result
    print cmax

if __name__=="__main__":
    main()
