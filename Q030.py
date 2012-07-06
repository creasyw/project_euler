import sys

def is_equal(num):
    digits = str(num)
    sum = 0
    for i in digits:
        sum += int(i)**5
    if sum == num:
        return True
    else:
        return False

ub = 9999999
result = []
for num in range(100, ub):
    if is_equal(num):
        result.append(num)
    sys.stdout.write("Complete %d\r" % (num))
    sys.stdout.flush()

print "There are %d numbers, and the sum is %d" % (len(result), sum(result))

