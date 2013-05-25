import sys, os
sys.path.append(os.path.abspath('..'))

import factor as ft

def main():
    limit = 500
    num = 0
    round = 0
    while True:
        round += 1
        num += round
        if len(ft.factors(num)) > limit:
            print num
            break

if __name__=="__main__":
    main()

