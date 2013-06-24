import os
import numpy as np

def product_four(lst):
    return max(reduce(lambda x,y:x*y, lst[i:i+4]) for i in range(len(lst)-3))

def hproduct(array):
    result = 0
    for row in array:
        result = max(result, product_four(row))
    return result

def dproduct(array):
    """ 
    this function only find the four consecutive number from upper left to lower right.
    If the other diagonal direction is the target, just rotate the array will be fine.
    """
    result = 0
    for i in range(4, len(array)):
        result = max(result,  product_four(array[:i, :i].diagonal())\
                     + product_four(array[-i:, :i].diagonal()))
    return result

def largest_product(array):
    return max([hproduct(array), hproduct(array.T), dproduct(array), dproduct(np.rot90(array))])

def main():
    # the size of array is pre-defined in the question
    array = np.zeros((20,20), dtype=int)
    ln = 0
    with open(os.path.join(os.path.dirname(__file__), "Q011.txt")) as datafile:
        for row in datafile:
            array[ln] = [int(k) for k in row.split(' ')]
            ln += 1
    print largest_product(array)

if __name__ == "__main__":
    main()


