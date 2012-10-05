import sys

def count_num (m, n):
    result = 0
    for a in range(1, m+1):
        for b in range(1,n+1):
            result += (m-(a-1))*(n-(b-1))
    return result

def main ():
    thres = 2e6

    # Find the preliminary bound to refine calculation boundary via 2*n
    pre = thres - count_num(2,3)
    distance = pre
    bound = 3
    while distance <= pre:
        bound += 1
        pre = distance
        distance = abs(thres-count_num(2, bound))
    bound -= 1
    result = [2, bound, pre]
    
    # Calculate the real result
    for m in range(3, bound//2+1):
        pre = abs(thres-count_num(m,3))
        for n in range(4, bound):
            distance = abs(thres-count_num(m, n))
            if distance > pre:
                break
            pre = distance
        if pre < result[2]:
            result = [m, n-1, pre]
        sys.stdout.write("Now playing with %d\r"%(m))
    print "\n",result
    print "The area is ", result[0]*result[1]

if __name__ == "__main__":
    main()
