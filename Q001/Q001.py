lst = range(1, 1000)
print sum(set(filter(lambda i: i%3==0, lst)).union(filter(lambda i: i%5==0, lst)))

