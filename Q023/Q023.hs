import Data.List as List
import qualified Data.Set as Set

factor n = List.sort $ concatMap
    (\x -> if x ^ 2 /= n then [x, n `div` x] else [x])
    [ x | x <- [1 .. round $ sqrt $ fromIntegral n], n `mod` x == 0 ]

isAbundant n = n < sum (init $ factor n)

sumOfNonAbundant limit = sum $ filter (notSumOfAbundunts setAbundants lstAbundants) [1..limit]
  where
    -- the 12 is the smallest abundant number given by the question
    lstAbundants = filter isAbundant [12..limit]
    setAbundants = Set.fromList lstAbundants

notSumOfAbundunts :: (Ord t, Integral t) => Set.Set t -> [t] -> t -> Bool
notSumOfAbundunts setAbundants (x:xs) num
  | x > div num 2 = True
  | Set.member (num - x) setAbundants = False
  | otherwise = notSumOfAbundunts setAbundants xs num

-- This is a solution that exceeds the time limit of GHCI
-- 1. Find all abundant numbers within a given limit (28123 is the ultimate limit for the question)
-- 2. Find the sum of any two of these abundant numbers in the list of step 1
-- 3. Subtract the result of step 2 from the sum of all numbers with the given limit
--
-- There are something unavoidable - finding the "abundant" numbers, but the
-- step 2 and 3 above have lot of room to optimize.
-- 1. Given [12...limit] to get the list of abundant numbers, the resulting list
-- is also sorted by default. As a result, we do need to find the unique
-- combinations of sum of any two numbers from this list, but only need to
-- subtract a member of this list from a given number and see if the rest is
-- also in the list. It changes the complexity from exponential to linear.
-- 2. It doesn't even need to search through the entire list, but only till the
-- n/2, where n is the given number. It is easy to do given the list of abundant
-- numbers is a sorted list.
