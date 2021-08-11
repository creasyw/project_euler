import sys


def is_equal(num, power):
    return num == sum(int(i)**power for i in str(num))


def main():
    ub = 999999
    power = 5
    print(sum(i for i in range(10, ub) if is_equal(i, power)))


if __name__ == "__main__":
    main()
