#!/usr/bin/env python
from calendar import monthrange; from itertools import product
print len([(year, month) for year, month in product(range(1901, 2001), range(1, 13)) if monthrange(year, month)[0] == 6])