module Factor where

import Data.List -- for sort
import Data.Numbers.Primes

factor n = filter (\x -> n `mod` x == 0) [1..n]

-- this is more efficient for huge number
-- but twisted in expression and added overhead for several iterations
factor1 :: Integral a => a -> [a]
factor1 n = nub $ sort $ concatMap (\x -> [x, n `div` x]) [x | x<-[1.. round $ sqrt $ fromIntegral n], n `mod` x ==0]

-- nub is to eliminate duplicated items in a list with complexity O(n^2)
-- the following func do a further optimization
factor2 n = sort $ concatMap (\x -> if x^2/=n then [x, n `div` x] else [x])
            [x | x<-[1.. round $ sqrt $ fromIntegral n], n `mod` x ==0]


primeFactor n = filter isPrime (factor n)


-- Used this at Q012. It use recursive function to get rid of sqrt...
factorize :: Integral a => a -> [a]
factorize x = findFactors 1 x []
  where findFactors a b lst =
          if a >= b then lst else
            if x `mod` a == 0 then
              let another = x `div` a in
                if another == a then findFactors (a+1) another ([a] ++ lst)
                else findFactors (a+1) another ([a, another] ++ lst)
            else findFactors (a+1) b lst
