from math import sqrt

# The deduction comes from the "summarization of process"
# the nth step includes: a(n) and 
# den/(sqrt(n)-sub) = den(sqrt(n)+sub)/n-sub**2 = a(n+1)+(sqrt(n)-next_sub)/next_den
# ==> next_den = n-sub**2/den and sqrt(n)+sub = sqrt(n)-next_sub+a(n+1)*next_den
# ==> next_sub = a(n+1)*next_den-sub
# ==> a(n+1) = int((sqrt(n)+sub)/next_den)
# The 1st denominator den(1)=1 and sub(1)=a(0) = int(sqrt(n))
def expand(n, den, sub):
    next_den = (n - sub**2)/den
    next_a = int((sqrt(n)+sub)/next_den)
    next_sub = next_den*next_a-sub
    return next_a, next_den, next_sub

def notation(n):
    a = int(sqrt(n))
    if a**2 == n:
        return []
    term, den, sub = expand(n, 1, a)
    terms = [term]
    # According to http://mathworld.wolfram.com/PeriodicContinuedFraction.html
    # n^.5 = [a0, (a1, a2, a3,..., a2, a1, 2a0)]
    while term != a*2:
        term, den, sub = expand(n, den, sub)
        terms.append(term)
    return terms

def main():
    count = 0
    for i in range(2,10001):
        if len(notation(i)) % 2 == 1:
            count += 1
    print count
        
if __name__ == "__main__":
    main()
