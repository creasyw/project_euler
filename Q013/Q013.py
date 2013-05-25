import os
import re
finder = re.compile("\d+")


def main():
    lst = []
    with open(os.path.join(os.path.dirname(__file__), "Q013.txt")) as datafile:
        for row in datafile:
            lst.append(int(finder.findall(row)[0]))
    print str(sum(lst))[:10]

if __name__=="__main__":
    main()

