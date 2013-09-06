# 1. From the Law of Cosines in triangle (http://en.wikipedia.org/wiki/Law_of_cosines)
#    Cos(C) = (a^2+b^2-c^2)/2ab. ==>In Q390, let x = 1+b^2, y = 1+c^2
#    Then the angle theta between sides x and y ==> cos(theta)^2 = 1/(xy)
# 2. We also know that given sides a, b and the angle phi between them, then
#    S = ab*sin(phi)/2 ==> S^2 = (ab*sin(phi)/2)^2, and sin(theta)^2 = 1-1/xy
#    ==> S^2 = xy*sin(theta)^2/4 = (xy-1)/4, which should be integers
# ==> x and y must be odd ==> b, c must be even ==> b = 2p, and c = 2q
# ==> S^2 = 4*p^2*q^2+p^2+q^2 
# ==> S^2 - (4*p^2+1)*q^2 = p^2 which is the generalized Pell's equation,
# where, D = 4*p^2+1 and N = p^2. To solve this equation, it needs to find
# the smallest non-trivial solution (a,b) for a^2-D*b^2=1 to use the
# recurrence equation "C*<q(n), S(n)>.T = <q(n+1), S(n+1)>.T", where
# 
#          /  a     b  \
#     C =  |           |
#          \ b*D    a  /
# 
# ==> a = 8*p^2+1 and b = 4p.
# q(0) = 0, S(0) = p serves as a seed, but it is not counted in the sum of 
# the areas because the problem (tacitly) assumes b, c > 0.

# N = 10**6  # Snswer: 18018206
N = 10**10  # Snswer: 2919133642971

def sum_areas(p, q, a):
    c11, c12 = 8*p*p + 1, 4*p
    c21, c22 = 4*p*(4*p*p + 1), c11
    q, a = c11*q + c12*a, c21*q + c22*a
    if a > N:
        return 0
    # (p, q) size a is counted at this time, but (q, p) and (q, -p) are not
    # counted for duplication or negative length, but are served as seeds
    # in the following rounds.
    return a + sum_areas(p, q, a) + sum_areas(q, p, a) + sum_areas(q, -p, a)

def main():
    total = 0
    for p in range(1, N+1):
        s = sum_areas(p, 0, p)
        if s == 0:
            break
        total += s
    
    print(total)

if __name__=="__main__":
    main()
