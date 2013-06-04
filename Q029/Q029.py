

def square_sequence(ar, br):
    result = set([])
    for a in range(2,ar):
        for b in range(2, br):
            result.add(a**b)
    return len(result)

ar = 100
br = 100
print square_sequence(ar+1, br+1)
