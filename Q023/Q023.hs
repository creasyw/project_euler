import Data.List as List
import qualified Data.Set as Set

factor n = List.sort $ concatMap
    (\x -> if x ^ 2 /= n then [x, n `div` x] else [x])
    [ x | x <- [1 .. round $ sqrt $ fromIntegral n], n `mod` x == 0 ]


-- 1. Find all abundant numbers within a given limit (28123 is the ultimate limit for the question)
-- 2. Find the sum of any two of these abundant numbers in the list of step 1
-- 3. Subtract the result of step 2 from the sum of all numbers with the given limit

isAbundant n = n < sum (init $ factor n)

sumOfNonAbundant limit = sum $ filter (notSumOfAbundunts setAbundants lstAbundants) [1..limit]
  where
    lstAbundants = filter isAbundant [12..limit]
    setAbundants = Set.fromList lstAbundants

notSumOfAbundunts :: (Ord t, Integral t) => Set.Set t -> [t] -> t -> Bool
notSumOfAbundunts setAbundants lstAbundants num
  | headA > div num 2 = True
  | Set.member (num - headA) setAbundants = False
  | otherwise = notSumOfAbundunts setAbundants (tail lstAbundants) num
  where headA = head lstAbundants
