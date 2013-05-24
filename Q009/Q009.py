# refer instruction to the racket solution
from math import sqrt

# one of the solution is to iterate in the list of factor,
# just as what is performing in the racket solution.
# But considering the formula m*(m+n)=num/2, the value of m could only be 2 to sqrt(num/2).
# It is more straightforward to iterate for the value of m to find the 1st hit
def pythagorean_triplet(num):
    fount = False
    sq = int(sqrt(num/2))
    for m in range(2, sq+1):
        if num%m != 0: continue
        n = num//2/m-m
        if 0< n and n< m: 
            found = True
            break

    if found:
        print "The result is ", (m**2-n**2)*2*m*n*(m**2+n**2)
    else:
        print "Sorry... cannot fount the value"

if __name__ == "__main__":
    pythagorean_triplet(1000)


