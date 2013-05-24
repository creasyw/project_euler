
def find_nth_prime (n):
    num = 9
    plst = [2,3,5,7]
    count = len(plst)
    flat = True

    while (count != n):
        for i in plst:
            if num%i == 0:
                flag = False
                break
        if flag:
            plst.append(num)
            count += 1
        else:
            flag = True
        num += 2

    print plst[-1]

find_nth_prime(10001)

