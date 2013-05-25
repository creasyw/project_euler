import numpy as np


def flooding_alg(arr):
    for i in range(1, len(arr)):
        for j in range(1, len(arr[0])):
            arr[i,j] = arr[i-1, j]+arr[i,j-1]
    return arr

def main():
    side = 21
    print flooding_alg(np.ones((side, side), dtype=int))[-1,-1]


if __name__ == "__main__":
    main()

