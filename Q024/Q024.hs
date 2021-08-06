import Data.List as List

-- Firstly.. it feels like cheating to use the function =permutation=, though it
-- gets things done pretty quickly... Secondly, it is redundant to use
-- =concatMap show [1..10]= to convert list of integers into string, since
-- string is the list of chars and it could directly work on chars
lexiIndex index = (List.sort $ List.permutations ['0'..'9']) !! (index - 1)
