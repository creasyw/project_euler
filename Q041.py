from itertools import permutations

def is_prime(num):
    base = int(num**0.5)+1
    for i in range(2,base):
        if num%i == 0:
            return False
    return True

def main():
    round = 10
    biggest_prime = 2
    for i in range(3,round+1):
        digits = range(1,i)
        generator = permutations(digits)
        for j in generator:
            num = int(''.join([str(k) for k in j]))
            if is_prime(num):
                biggest_prime = max(num, biggest_prime)
    
    print biggest_prime

if __name__=="__main__":
    main()
