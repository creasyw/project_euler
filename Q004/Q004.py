def check_palindrome(num):
    temp = str(num)
    for i in range(len(temp)/2+1):
        if temp[i] != temp[-i-1]: return False
    return True

def main(upper, lower):
    result = 0
    # simultanously increase the lower bound and decrease the upper bound
    # so that the program won't hit the O(n^2) complexity
    while (upper>lower):
        temp = 0
        for i in range(upper-1, lower-1, -1):
            temp = upper*i
            if check_palindrome(temp): break
        lower = i
        upper -= 1
        if result < temp: result = temp
    print result

if __name__ == "__main__":
    main(999, 100)
