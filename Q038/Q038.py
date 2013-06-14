def is_pandigital(digits, length=9):
    num = sorted(digits)
    if len(num) != length:
        return False
    for i in range(len(num)):
        if str(i+1)!=num[i]:
            return False

    return True

def main():
    largest = 0
    result = 0
    ub = 9999
    for i in range(ub):
        digits = ''
        base = 1
        while True:
            digits += str(base*i)
            base += 1
            if len(digits)==9:
                if is_pandigital(digits) and int(digits)>largest:
                    largest = int(digits)
                    result = i
                break
            elif len(digits)>9:
                break
    print result
    print largest
    
if __name__=="__main__":
    main()
