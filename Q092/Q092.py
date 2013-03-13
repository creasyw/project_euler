import sys
calculated = set([89])

def end_eightynine (num):
    global calculated
    originial = num
    while True:
        if num in calculated:
            calculated.add(originial)
            return True
        elif num == 1:
            return False
        else:
            num = reduce(lambda acc, itr: itr**2+acc, [int(k) for k in str(num)], 0)

def main ():
    limit = 10000001
    count = 0
    for i in xrange(1, limit):
        if end_eightynine(i):
            count += 1
            sys.stdout.write("Now calculating %d\r"%(i))
            sys.stdout.flush()
    print "\n\n", count

if __name__ == "__main__":
    main()

