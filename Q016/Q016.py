from math import pow


def sum_power (ex):
    return sum(int(k) for k in str(int(pow(2, ex))))

print sum_power(1000)

