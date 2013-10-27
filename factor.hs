module Factor where

import Data.Numbers.Primes

factor n = filter (\x -> n `mod` x == 0) [1..n]

primeFactor n = filter isPrime (factor n)
