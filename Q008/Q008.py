import functools
import os

# we can always do `reduce` for the given range, but the complexity becomes O(M*N), where M is the
# length of the input number and N is the range. On the other hand, if we only operate on the two
# numbers that is about to discard and about to add, the complexity becomes O(M). It is independent
# from the range.
#
# The only tricky part is the number zero.
def largest_product(lst, count):
    current = result = functools.reduce(lambda x, y: x * y, lst[:count], 1)
    for i in range(len(lst)-count):
        if lst[i] == 0:
            current = functools.reduce(lambda x, y: x * y, lst[(i+1):(i+count+1)], 1)
        else:
            current = current // lst[i] * lst[i+count]
        result = max(result, current)
    return result

def main():
    register, count = "", 13
    with open(os.path.join(os.path.dirname(__file__), "Q008.txt")) as handler:
        for line in handler:
            register += line
    print(largest_product([int(k) for k in register[:-1]], count))

if __name__ == "__main__":
    main()
