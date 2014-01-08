import Data.Numbers.Primes

largestPrimeFactor n = last . filter (\x-> n `mod` x ==0) $ takeWhile (< (floor $ sqrt $ fromIntegral n)) primes
