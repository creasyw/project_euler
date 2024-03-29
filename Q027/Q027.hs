import Data.Numbers.Primes as P


-- Good to have the ability working with infinite list
countPrimes :: (Int -> Int) -> Int
countPrimes func = length $ takeWhile (P.isPrime . func) [0..]

-- the anonymous function is more of a dispatch between =foldl= and the helper
-- function - feed two tuples into a function and get the resulting tuple as
-- accumulation.
longestPrimes :: (Int, Int)
longestPrimes = foldl (\(acc, product) (a, b) -> helper acc product a b)
                (0, 0)
                [(x, y) | x <- [-999..999], y <- [2..999]]
  where helper acc product a b = if acc < newVal
                                 then (newVal, a * b)
                                 else (acc, product)
          where newVal = countPrimes (\x -> x ^ 2 + a * x + b)
