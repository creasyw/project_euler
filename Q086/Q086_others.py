from math import sqrt
L = 1000000
c = 0
a = 2
while c < L:
    a += 1
    for bc in range(3, 2*a):
        if (bc*a) % 12: continue
        s = sqrt(bc*bc + a*a)
        if s == int(s):
            c += min(bc, a+1) - (bc+1)/2 
                                   
print "Answer to PE86 =",a
