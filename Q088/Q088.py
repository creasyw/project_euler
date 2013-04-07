import os
import sys
sys.path.append(os.path.abspath('..'))
import factor
from math import ceil

# Observations:
#   1) for all factors, a*b>=a+b
#   2) given k, the product-sum N should be in the range [k, 2k].
#       Because we can always use the factors {2,k} this gives us the product 2k and the 
#       sum 2+k. By adding k-2 ones we end up with a valid product sum for k which equals 2k

from collections import defaultdict
lookups = defaultdict(list)

def is_product_sum (num):
    factors = factor.factors(num)[1:-1]
    if len(factors) == 0: return 0
    for i in factors:
        if num/i in lookups:
            for itr in lookups[num/i]:
                lookups[num].append(itr+[i])
    for i in range(int(ceil(len(factors)/2.))):
        lookups[num].append([factors[i], num/factors[i]])
    # check the index k corresponding to num
    index = set()
    for i in lookups[num]:
        index.add(len(i)+num-sum(i))
    return sorted(index)

def main ():
    k = 12000
    result = [0 for i in range(k+1)]
    for i in range(2, k*2+1):
        indice = is_product_sum(i)
        if type(indice)!=int:
            for j in indice:
                if j<k and result[j]==0 :
                    result[j] = i
    print sum(set(result))

if __name__ == "__main__":
    main()

