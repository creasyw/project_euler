# Find the permutations of cube to check if it is the 3 square
# of a integer edge is not practical comparing with check edges.

def four_cubes(n):
    cube = n**3
    digits = sorted([int(k) for k in str(cube)], reverse=1)
    upperbound = int(''.join([str(k) for k in digits]))
    count = 0
    edge = n+1

    while True:
        v = edge**3
        candidate = sorted([int(k) for k in str(v)], reverse=1)
        if candidate == digits:
            count +=1
        if v > upperbound:
            break
        edge += 1

    if count == 4:
        return True
    else:
        return False

def main():
    edge = 5
    while True:
        if four_cubes(edge): break
        edge += 1
    print edge**3

if __name__ == "__main__":
    main()

