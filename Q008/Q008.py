import os

def largest_product (lst):
    result = 0
    for i in range(len(lst)-5):
        temp = reduce(lambda x, y: x*y, lst[i:(i+5)],1)
        result = max(result, temp)
    return result

def main():
    lst = []
    with open(os.path.join(os.path.dirname(__file__), "Q008.txt")) as datafile:
        for row in datafile:
            # the last character of each line is line break
            lst += [int(k) for k in row[:-1]]
    print largest_product(lst)

if __name__ == "__main__":
    main()


