from prime import is_prime

def corners(layer):
    side_length = layer*2-1
    return [side_length**2-(layer-1)*2*k for k in range(4)]

def main():
    layer = 2
    benchmark = 0.1
    diagonals = 1
    nprime = 0

    while True:
        corner = corners(layer)
        for i in corner:
            if is_prime(i):
                nprime += 1
        diagonals += 4
        if float(nprime)/diagonals < benchmark:
            break
        layer += 1

    print layer*2-1

if __name__ == "__main__":
    main()

