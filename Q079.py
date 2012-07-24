import os
from collections import defaultdict

def main():
    attempts = [line.strip() for line in open(os.path.join(os.path.dirname(__file__), 'keylog.txt')).readlines()]
    appearances = defaultdict(list)
    for attempt in attempts:
        for i, n in enumerate(attempt):
            appearances[n].append(i)
    
    average_position = {}
    for k, v in appearances.items():
        average_position[k] = float(sum(v))/len(v)

    a = [k for k, v in sorted(average_position.items(), key=lambda a: a[1])]
    print ''.join(str(x) for x in a)

if __name__ == "__main__":
    main()

