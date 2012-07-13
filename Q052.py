from permutation import next_permutation

def is_suitable(num):
    digits = [k for k in str(num)]
    pool = list(next_permutation(digits))
    for time in range(2,7):
        candidate = [k for k in str(num*time)]
        if len(candidate) != len(digits) or candidate not in pool:
            return False
    return True

def main():
    num = 10
    while True:
        if is_suitable(num):
            break
        num +=1
    print num

if __name__=="__main__":
    main()

