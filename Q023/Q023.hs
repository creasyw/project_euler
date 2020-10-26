import Data.List as List
import qualified Data.Set as Set

factor n = List.sort $ concatMap
    (\x -> if x ^ 2 /= n then [x, n `div` x] else [x])
    [ x | x <- [1 .. round $ sqrt $ fromIntegral n], n `mod` x == 0 ]


-- 1. Find all abundant numbers within a given limit (28123 is the ultimate limit for the question)
-- 2. Find the sum of any two of these abundant numbers in the list of step 1
-- 3. Subtract the result of step 2 from the sum of all numbers with the given limit

isAbundant n = n < (sum $ init $ factor n)

listOfNum limit = filter isAbundant [12..limit]

sumOfTwo lst acc
  | length lst == 0 = acc
  | otherwise = sumOfTwo (tail lst) (innerLoop (head lst) (tail lst) acc)
  where innerLoop c d accLst
          | length d == 0 = accLst
          | otherwise = innerLoop c (tail d) (Set.insert (c + (head d)) accLst)
