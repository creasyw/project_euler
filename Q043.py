from itertools import permutations

def is_proper(num):
    prime = [2,3,5,7,11,13,17]
    for i in range(1,8):
        tester = int(''.join([str(k) for k in num[i:(i+3)]]))
        if tester%prime[i-1]!=0:
            return False
    return True

def main():
    result = []
    sum = 0
    digits = range(10)
    generator = permutations(digits)
    for num in generator:
        if num[0] == 0:
            continue
        if is_proper(num):
            number = int(''.join([str(k) for k in num]))
            result.append(number)
            sum += number
    print result
    print sum

if __name__=="__main__":
    main()

