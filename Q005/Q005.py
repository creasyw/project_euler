# im think i might be much smarter when i was programming in racket...

def smallest_product(begin, end):
    lst = range(begin, end+1)
    for i in range(len(lst)-1):
        lst[i+1:] = map(lambda x: x/lst[i]if x%lst[i]==0 else x, lst[i+1:])
    return reduce(lambda x, y: x*y, lst)

print smallest_product(1, 20)


