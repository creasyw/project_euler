import Data.Numbers.Primes as Primes

sumPrimes limit = sum $ takeWhile (<limit) Primes.primes
