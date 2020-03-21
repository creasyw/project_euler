import Data.Numbers.Primes as Primes

findPrime x = last $ take x Primes.primes
