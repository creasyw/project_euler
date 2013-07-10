
def is_palindromic(num):
    digits = [k for k in str(num)]
    # Test palidromic for base 10
    for i in range(len(digits)/2):
        if digits[i]!=digits[-1-i]:
            return False
    return True

def reverse_num(num):
    return int(''.join(str(num)[::-1]))

def main():
    result = 0
    upperbound = 10000
    maxround = 50

    for i in range(upperbound):
        round = 1
        temp = i
        found = False
        while round < maxround:
            temp = temp + reverse_num(temp)
            if is_palindromic(temp):
                found = True
                break
            round += 1
        if not found:
            result += 1

    print result

if __name__ == "__main__":
    main()
