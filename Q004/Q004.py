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


def solution2():
    print max(a*b for a in range(100,1000) for b in range(100, 1000) if str(a*b)==str(a*b)[::-1])

if __name__ == "__main__":
    #main(999, 100)
    solution2()
