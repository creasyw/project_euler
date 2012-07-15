def triangle(n):    return n*(n+1)/2
def square(n):      return n**2
def pentagonal(n):  return n*(3*n-1)/2
def hexagonal(n):   return n*(2*n-1)
def heptagonal(n):  return n*(5*n-3)/2
def octagnonal(n):  return n*(3*n-2)

def is_cyclic(a, b):
    return str(a)[-2:] == str(b)[:2]

def main():
    figurates = {
            3: filter(lambda n: n<10000 and n>1000, map(triangle, range(1000))),
            4: filter(lambda n: n<10000 and n>1000, map(square, range(1000))),
            5: filter(lambda n: n<10000 and n>1000, map(pentagonal, range(1000))),
            6: filter(lambda n: n<10000 and n>1000, map(hexagonal, range(1000))),
            7: filter(lambda n: n<10000 and n>1000, map(heptagonal, range(1000))),
            8: filter(lambda n: n<10000 and n>1000, map(octagnonal, range(1000)))
            }
    numbers = [(key, value) for key in figurates.keys() for value in figurates[key]]
    for k1, v1 in numbers:
        for k2, v2 in [(k,v) for k, v in numbers if k not in [k1] and is_cyclic(v1, v)]:
            for k3, v3 in [(k, v) for k, v in numbers if k not in [k1, k2] and is_cyclic(v2, v)]:
                for k4, v4 in [(k, v) for k, v in numbers if k not in [k1, k2, k3] and is_cyclic(v3, v)]:
                    for k5, v5 in [(k, v) for k, v in numbers if k not in [k1, k2, k3, k4] and is_cyclic(v4, v)]:
                        for k6, v6 in [(k, v) for k, v in numbers if k not in [k1, k2, k3, k4, k5] and is_cyclic(v5, v)]:
                            if is_cyclic(v6, v1):
                                print v1, v2, v3, v4, v5, v6
                                print sum([v1, v2, v3, v4, v5, v6])
                                return

if __name__ == "__main__":
    main()

