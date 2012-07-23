# This question is very similar with Q076, but dynamic programming cannotwork here 
# since the explosion of number of combinations.In theory, this is about "partition" 
# in number theory: p(n) = p(n-1)+p(n-2)-p(n-5)-p(n-7)+p(n-12)+p(n-15)-p(n-22)-...,
# where p(0)=1 and p(k)=0 (k<0). the variable is generalized pentagonal numbers.


def generalized_pentagnal(n):
    """
    Generalized pentagonal numbers (http://en.wikipedia.org/wiki/Pentagonal_number)
    """
    return (3*((-1)**(n+1)*((n+1)//2))**2-(-1)**(n+1)*((n+1)//2))/2

def partition(plist):
    """
    Calculate the next partition number in the list
    http://en.wikipedia.org/wiki/Partition_%28number_theory%29
    """
    length = len(plist)
    count = 0
    index = generalized_pentagnal(count+1)
    new = 0
    while index <= length:
        new += (-1)**(count//2)*plist[-index]
        count += 1
        index = generalized_pentagnal(count+1)
    return plist+[new]

def main():
    divisor = 10**6
    n = 10
    plist = [1,1,2]
    while True:
        plist = partition(plist)
        if plist[-1] % divisor == 0:
            break
    print len(plist)-1

if __name__ == "__main__":
    main()
