import           Data.List                     as List
import           Data.Map.Strict               as Map
import           Data.Numbers.Primes           as Primes

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


-- 1. this is a much better solution
-- 2. the typeclass in Haskell is killing me. =10 `div` 2= gets a =5= in =Int=,
-- but =10/2= gets a =5.0= which is a =Fractional=. I haven't figuer out an
-- elegant way to convert it back to =Integral=. =ceiling=, =floor=, =truncate=,
-- =round= would somehow introduce a =RealFrac= type into the signature of the
-- function =recursiveReduce= which makes it in turn uncompatible with =foldl=.
--
-- This algorithm iterates from the smallest element to the largest one. It
-- avoids deducing prime numbers as well as avoiding using map. The basic idea
-- is that assuming we need the range from a to b, the product of this range
-- should only contain /one/ a. For all other numbers with the range (e.g. 2a,
-- 3a, 4a...), the factor a can be removed.
smallestDivisible' :: Integral a => a -> a -> a
smallestDivisible' x y = List.foldl (*) 1 (recursiveReduce [x .. y])
  where
    recursiveReduce [] = []
    recursiveReduce (x : xs) =
        x
            : (recursiveReduce
                  (List.map (\k -> if k `mod` x == 0 then k `div` x else k) xs)
              )
