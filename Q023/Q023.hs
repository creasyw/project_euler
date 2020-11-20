{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleContexts #-}
import Data.List as List
import qualified Data.Set as Set

factor n = List.sort $ concatMap
    (\x -> if x ^ 2 /= n then [x, n `div` x] else [x])
    [ x | x <- [1 .. round $ sqrt $ fromIntegral n], n `mod` x == 0 ]


-- 1. Find all abundant numbers within a given limit (28123 is the ultimate limit for the question)
-- 2. Find the sum of any two of these abundant numbers in the list of step 1
-- 3. Subtract the result of step 2 from the sum of all numbers with the given limit

isAbundant n = n < (sum $ init $ factor n)

sumOfTwo lst = helper lst lst Set.empty
  where helper a b acc
          | length b == 0 = acc
          | otherwise = helper a (tail b) (innerLoop (head b) a acc)
          where innerLoop c d accLst
                  | length d == 0 = accLst
                  | otherwise = innerLoop c (tail d) (Set.insert (c + (head d)) accLst)

sumOfUniqueTwo lst acc
  | length lst == 0 = acc
  | otherwise = sumOfUniqueTwo (tail lst) (innerLoop (head lst) (tail lst) acc)
  where innerLoop c d accLst
          | length d == 0 = accLst
          | otherwise = innerLoop c (tail d) (Set.insert (c + (head d)) accLst)

sumOfAbundant limit = Set.foldl' (\acc i -> if i < limit then acc + i else acc) 0 (sumOfTwo (filter isAbundant [12..limit]))

-- *** Exception: stack overflow
sumOfNonAbundant1 limit = (sum [1..limit]) - (sumOfAbundant limit)


sumOfNonAbundant limit = foldl (\acc i -> if (isNonAbundunt i (filter isAbundant [12..limit])) then acc + i else acc) 0 [1..limit]

isNonAbundunt x lstAbundant = helper lstAbundant
  where helper i  = if (header) > (x / 2)
                    then True
                    else if (x - header) `elem` lstAbundant
                         then False
                         else helper i
          where header = head i
