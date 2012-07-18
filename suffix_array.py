def make_multi(texts):
    indexes = []
    nt = len(texts)
    for d in xrange(nt): 
        size = len(texts[d])
        for i in xrange(size):
            e = d,i
            indexes.append(e)

    def compare(e0,e1):
        d0, i0 = e0
        d1, i1 = e1
        s0 = texts[d0][i0:]
        s1 = texts[d1][i1:]
        return cmp(s0,s1)

    indexes.sort(cmp = compare)
    return indexes

def sa_list(text):
    size = len(text)
    def compare_suffix(i, j):
        return cmp(text[i:], text[j:])
    indexes = range(size)
    indexes.sort(cmp = compare_suffix)
    return indexes
