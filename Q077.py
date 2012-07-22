from prime import gen_prime

def solve_prime_plus(target, nums):
    if target == 0:
        return 1
    # For only primes in list, there are some cases cannot be solved
    elif len(nums) == 1:
        if target % nums[0] == 0:
            return 1
        else:
            return 0
    else:
        largest = nums[-1]
        uses = target/largest
        total = 0
        for i in range(uses+1):
            total += solve_prime_plus(target-largest*i, nums[:-1])
        return total

def main():
    primes = gen_prime(1000)
    target = 2
    while True:
        result = solve_prime_plus(target, [k for k in primes if k <= target])
        if result > 5000:
            break
        target += 1
    print target

if __name__ == "__main__":
    main()
