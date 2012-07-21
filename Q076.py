# It is similar to Q031, which could be solve via dynamic programming

def solve_plus(target, nums):
    if target == 0 or len(nums) == 1:
        return 1
    else:
        largest = nums[-1]
        uses = target/largest
        total = 0
        for i in range(uses+1):
            total += solve_plus(target-largest*i, nums[:-1])
        return total

def main():
    print solve_plus(100, range(1,100))

if __name__ == "__main__":
    main()
