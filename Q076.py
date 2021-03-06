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

# The difference between this Q and Q031 is that Q031 only has limited choices to
# construct the final number, but Q076 and Q079 have all possible choices less than
# the given number to construct it! It becomes straightforward to use the math @
# http://mathworld.wolfram.com/PartitionFunctionP.html
def solution_2():
    from Q078 import pentagonal, partition
    generalized_pentagonals = sorted(map(pentagonal, range(-100,100)))[1:]
    partitions = {}
    # Need subtract 1 for n = n+0
    print partition(100, partitions, generalized_pentagonals)-1

if __name__ == "__main__":
    #main()
    solution_2()
