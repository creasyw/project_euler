digit = ''.join((str(digit) for digit in range(1, 10000001)))
print reduce(lambda x,y: x*y, map(lambda x: int(digit[10**x-1]), range(6)), 1)
