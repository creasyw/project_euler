import Data.List as List
import Data.Map.Strict as Map
import Data.Numbers.Primes as Primes

-- The general thought is different from (and probably sub-optimal to) the
-- Python/Racket algorithm. Basically, it counts the number of prime factors in
-- the range and only keep the minimum amount that could assemble all numbers.
-- For example, after it iterates through 9 and 8, we have [(2, 3), (3, 2)]. For
-- 6 = [(2, 1), (3, 1)], it has already satisfied.
-- Still, using the primes library feels like cheating...
countFactor :: (Integral a) => a -> [(a, Int)]
countFactor x =
    List.map (\l@(x : xs) -> (x, length l)) . List.group $ Primes.primeFactors x

countFactorRange :: (Integral a) => a -> a -> Map a Int
countFactorRange a b = List.foldl
    (\acc x -> mergeFactor (countFactor x) acc)
    Map.empty
    [a .. b]
  where
    mergeFactor newFactors acc =
        Map.unionWith (\lv rv -> max lv rv) (Map.fromList newFactors) acc

smallestDivisible :: (Integral a) => a -> a -> a
smallestDivisible a b = Map.foldlWithKey
    (\acc key val -> acc * (key ^ val))
    1
    (countFactorRange a b)
