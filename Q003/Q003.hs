import Data.Numbers.Primes as Primes

-- it feels like cheating to use the primes package
largestPrimeFactor n =
    last
        . filter (\x -> n `mod` x == 0)
        . takeWhile (< (floor . sqrt $ fromIntegral n))
        $ Primes.primes

largestPrimeFactor' n p =
    last
        . filter (\x -> n `mod` x == 0)
        . takeWhile (< (floor . sqrt $ fromIntegral n))
        $ p

-- Peroformance comparison -
-- largestPrimeFactor' 600851475143 p1
-- 6857
-- (15.63 secs, 9,693,055,760 bytes)
-- largestPrimeFactor' 600851475143 p2
-- 6857
-- (7.91 secs, 4,994,426,496 bytes)
-- largestPrimeFactor 600851475143
-- 6857
-- (0.14 secs, 308,934,864 bytes)

p1 :: (Integral a) => [a]
p1 = 2 : 3 : primes'
  where
    isPrime (p : ps) n = p * p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 5 : filter (isPrime primes') [7, 9 ..]

-- it likes a fucking rabbit hole..
-- https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
-- https://en.wikipedia.org/wiki/Generation_of_primes
-- Its time complexity for finding all primes below N in a RAM model is
-- O(NloglogN)
p2 :: (Integral a) => [a]
p2 = 2 : 3 : 5 : primes'
  where
    isPrime (p : ps) n = p * p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 7 : filter
        (isPrime primes')
        -- the wheel of the sieve is [11,13,17,19,23,29,31,37,41]
        (scanl (+) 11 $ cycle [2, 4, 2, 4, 6, 2, 6, 4])
