
def is_prime(num):
    base = int(num**0.5)+1
    for i in range(2,base):
        if num%i == 0:
            return False
    return True

def is_goldbach(num):
    base = 1
    left = 1
    while True:
        left = num - 2*(base**2)
        if left <= 0:
            break
        if is_prime(left):
            return True
        base +=1
    return False

def main():
    num = 3
    while True:
        num +=2
        if is_prime(num):
            continue
        if not is_goldbach(num):
            break
    print num

if __name__=="__main__":
    main()

