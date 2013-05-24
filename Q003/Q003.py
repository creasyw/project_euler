import os
import sys
sys.path.append(os.path.abspath('..'))
import factor as ft


pf = ft.prime_factors(600851475143)
print pf[-1][0]



