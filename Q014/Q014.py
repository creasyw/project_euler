from collections import defaultdict

def count_length(num, dict):
    count = 1
    acc = num
    while acc != 1:
        if acc%2==0:
            acc /= 2
        else:
            acc = acc*3+1
        count += 1
        if acc in dict:
            dict[num] = count + dict[acc]
            return dict[num]
    dict[num] = count
    return count

def main():
    limit = 1000000
    result = largest = 0
    dict = defaultdict()
    for i in range(2, limit):
        temp = count_length(i, dict)
        if (temp > largest):
            result = i
            largest = temp
    print result

if __name__=="__main__":
    main()


