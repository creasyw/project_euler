import re

finder = re.compile("0b(\d+)")

def is_palindromic(num):
    digits = [k for k in str(num)]
    # Test palidromic for base 10
    for i in range(len(digits)/2):
        if digits[i]!=digits[-1-i]:
            return False
    # Test palidromic for base 2
    digits = [k for k in finder.findall(bin(num))[0]]
    for i in range(len(digits)/2):
        if digits[i]!=digits[-1-i]:
            return False
    
    return True

def main():
    ub = 1000000
    result = []
    sum = 0
    for i in range(ub):
        if is_palindromic(i):
            result.append(i)
            sum += i
    
    print result
    print sum

if __name__=="__main__":
    main()

