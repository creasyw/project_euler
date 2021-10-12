import Data.Numbers.Primes as Primes

-- generate the circular numbers of the input number
circularPrime :: Int -> Bool
circularPrime x = let strNum = show x
                in helper 1 strNum [x]

helper :: Int -> String -> [Int] -> Bool
helper index strNum acc =
  if index >= length strNum
  then True
  else let (a, b) = splitAt index strNum
           newNum = read (b ++ a) :: Int
       in if Primes.isPrime newNum
          then helper (index + 1) strNum (acc ++ [newNum])
          else False

countCircularPrimes :: Int -> Int
countCircularPrimes limit = length $ filter circularPrime $ takeWhile (< limit) Primes.primes
