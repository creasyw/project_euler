
def draw_cards(cards, value):
    """
    Generalize statistics for the cards in hand.
    Return dictionary including both CardValue as keys with CardKind 
    as values and CardKind as keys with CardValue as values.
    """
    hand = {}
    for card in cards:
        hand.setdefault(value[card[0]],{})[card[1]] = 1
        hand.setdefault(card[1], {})[value[card[0]]] = 1
    return hand

def get(hash, arr): return ((i, hash.get(i, {})) for i in arr)
def has(hash, arr): return not sum(1 for i in arr if i not in hash)

def rank(hand, all_kinds, all_suits):
    # Royal flush
    for suit, kinds in get(hand, all_suits):
        if has(kinds, tuple('TJQKA')):
            return (9,)

    # Straight flush
    for suit, kinds in get(hand, all_suits):
        kinds = sorted(kind for kind in kinds.keys())
        if len(kinds) == 5 and kinds[4] - kinds[0] == 4:
            return (8, kinds[0])

    # Four of a kind
    for kind, suits in get(hand, all_kinds):
        if len(suits.keys()) == 4:
            return (7, kind)

    # Full house
    for kind, suits in get(hand, all_kinds):
        if len(suits.keys()) == 3:
            for kind2, suits2 in get(hand, all_kinds):
                if len(suits2.keys()) == 2:
                    return (6, kind, kind2)

    # Flush
    for suit, kinds in get(hand, all_suits):
        if len(kinds.keys()) == 5:
            return (5,)

    # Straight
    kinds = sorted(kind for kind in all_kinds if hand.has_key(kind))
    if len(kinds) == 5 and kinds[4] - kinds[0] == 4:
        return (4, kinds[0])

    # Three of a kind
    for kind, suits in get(hand, all_kinds):
        if len(suits.keys()) == 3:
            return (3, kind)

    # Two pairs
    for kind, suits in get(hand, all_kinds):
        if len(suits.keys()) == 2:
            for kind2, suits2 in get(hand, all_kinds):
                if kind != kind2 and len(suits2.keys()) == 2:
                    return (2, kind, kind2)

    # One pair
    for kind, suits in get(hand, all_kinds):
        if len(suits.keys()) == 2:
            return (1, kind)

    for kind in all_kinds:
        if kind in hand:
            return (0, kind)

    return 0

def main():
    value = {'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'T':10,'J':11,'Q':12,'K':13,'A':14}
    all_kinds = tuple(reversed(sorted(value.values())))
    all_suits = list('DCSH')

    count = 0
    for hand in open('Q054_poker.txt'):
        hands = hand.split(' ')
        if len(hands)!=10:
            raise ValueError('the length for every row should be 10.')
        p1, p2 = draw_cards(hands[:5], value), draw_cards(hands[5:], value)
        v1, v2 = rank(p1, all_kinds, all_suits), rank(p2, all_kinds, all_suits)
        if v1 > v2: count+=1
    print count

if __name__ == "__main__":
    main()
    
