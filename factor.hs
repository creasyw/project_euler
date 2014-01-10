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
