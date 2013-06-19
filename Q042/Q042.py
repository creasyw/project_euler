from string import ascii_uppercase
import os

def is_trinum(num):
    """Test if a number is triangule number"""
    # num = .5*n*(n+1) ==> n = ((1+8*num)^.5-1)/2
    base = ((1+8*num)**0.5-1)/2
    if int(base)==base:
        return True
    else:
        return False

def triangle_value(index):
    return 0.5*index*(index+1)

def letter_value(letter):
    return ascii_uppercase.index(letter.upper())+1

def word_value(word):
    return sum(letter_value(letter) for letter in word)

def main():
    words = [word.strip('"') for word in open(os.path.join(os.path.dirname(__file__), 'words.txt')).read().split(',')]
    total = 0
    for word in words:
        if is_trinum(word_value(word)):
            total +=1
    print total

if __name__=="__main__":
    main()

