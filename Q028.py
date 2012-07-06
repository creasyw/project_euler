
def diagnal_list(dim):
    cycle = dim/2+1
    diagnal = []
    for i in range(cycle):
        point = dim**2
        diagnal.append(point)
        diagnal.append(point-dim+1)
        diagnal.append(point-2*(dim-1))
        diagnal.append(point-3*(dim-1))
        dim -= 2
        if dim == 1:
            break
    diagnal.append(1)
    return diagnal

dim = 1001
diagnal = diagnal_list(dim)
print "The result of Q028 is ", sum(diagnal)

