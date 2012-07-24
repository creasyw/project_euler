import os
from collections import defaultdict

def flooding(matrix):
    rows = len(matrix)
    cols = len(matrix[0])
    for row in range(rows):
        for col in range(cols):
            if row != 0 and col != 0:
                matrix[row][col] += min(matrix[row-1][col], matrix[row][col-1])
            elif row == 0 and col != 0:
                matrix[row][col] += matrix[row][col-1]
            elif row != 0 and col == 0:
                matrix[row][col] += matrix[row-1][col]
    print "Calculate complete"
    return matrix[rows-1][cols-1]

def main():
    matrix = defaultdict(list)
    count = 0
    with  open(os.path.join(os.path.dirname(__file__), 'matrix.txt')) as matfile:
        for row in matfile:
            matrix[count] = [int(k) for k in row.split(',')]
            count += 1
    print flooding(matrix)

if __name__ == "__main__":
    main()
