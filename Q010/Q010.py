import sys, os
sys.path.append(os.path.abspath('..'))

import prime

print sum(prime.gen_prime(2000000))

