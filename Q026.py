from decimal import Decimal, getcontext
import re
import sys

r = re.compile(r"(.+?)\1+")

def runWithPrecision(num, pre):
    if pre >= 5000:
        return 0
    getcontext().prec = pre
    result = str(Decimal(1)/Decimal(num))
    fraction = r.findall(result)
    intfrac = [int(k) for k in fraction] + [1]
    longest = max(intfrac)

    result = str(result)
    clong = str(longest)+str(longest)+str(longest)
    if clong not in result:
        longest = runWithPrecision(num, pre*2)

    return longest


# Main script
precision = 50
length = 0
number = 0
for num in range(2,1000):
    fraction = str(runWithPrecision(num, precision))
    if len(fraction) > length:
        length = len(fraction)
        number = num

print "The longest fraction comes from %d with length %d" % (number, length)


