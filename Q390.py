# From the Question, we can conduct that h=(m^2+n^2+m^2*n^2)/(m^2+n^2)
# Hence, S = sqrt(m^2+n^2+m^2*n^2)/2

from math import sqrt
import sys

bound = pow(10, 10)
result = int(0)

b = 2
upper  = int(sqrt(bound/4-1))
print "The upper bound is " , upper

while b<=upper:
    c = b
    while True:
        # Calculate the size of the triangle
        asquare = b**2
        bsquare = c**2
        size = sqrt(asquare+bsquare+asquare*bsquare)/2
        # Test if size meets prerequisite
        if size > bound:
            break
        elif int(size)==size:
            result += size
            c += c*3
        else:
            c +=1
        
    sys.stdout.write("Complete %d\r"%b)
    sys.stdout.flush()
    b +=1

print "The final result is ", result

