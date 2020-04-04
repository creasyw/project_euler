# hey dp, miss you much :)
# for every chain reaction, we actually also find all answers for the number within the chain - it
# is the typical puzzle for Dynmaic Programming. In the implementation, there is actually no need
# for a map. A list is enough - using index to represent the number and the value in the list to
# represent the length of the chain. To further optimize it, we can remember the max value and its
# position (the number) while iterating through the list.

def collatz(limit):
    def find_length(register, num, acc):
        if num < limit and register[num] != 0:
            for index, val in enumerate(acc[::-1]):
                if val > limit:
                    continue
                register[val] = register[num] + 1 + index
            return
        acc.append(num)
        if num % 2 == 0:
            return find_length(register, num // 2, acc)
        else:
            return find_length(register, 3 * num + 1, acc)

    register = [0] * (limit + 1)
    register[1] = 1

    for num in range(2, len(register)):
        if register[num] != 0:
            continue
        find_length(register, num, [])

    return register.index(max(register))
