# The solution is created by Zen Denton
# http://zacharydenton.com/project-euler-solutions/31/
# The searching procedure can be regarded as a tree traversal,
# where the larger coin in the upper level versus smaller ones
# in the lower level. Then, the recursion is straightforward.

def ways_to_change(target, coins):
    if target == 0 or len(coins) == 1:
        return 1
    else:
        coins.sort()
        largest = coins[-1]
        uses = target/largest
        total = 0
        for i in range(uses+1):
            total += ways_to_change(target-largest*i, coins[:-1])
        return total

def main():
    print ways_to_change(200, [1,2,5,10,20,50,100,200])

if __name__=="__main__":
    main()
