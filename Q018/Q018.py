import csv
import re

# Prepare for the dataset
finder = re.compile("\d+")
data = csv.reader(open("Q067.data",'r'))
tower = {}
count = 0
for row in data:
    tower[count] = [int(k) for k in finder.findall(row[0])]
    count +=1

height = len(tower)
for row in range(1,height):
    elements = tower[row]
    base = tower[row-1]
    assert len(elements)==len(base)+1, \
            "There is something wrong about the length of %d row"%(row)
    elements[0] += base[0]
    for i in range(1,len(base)):
        elements[i] = max(elements[i]+base[i-1], elements[i]+base[i])
    elements[-1] += base[-1]

print "Maximum value for the final line is ", max(tower[height-1])

