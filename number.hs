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
  where findFactors a b lst
          | a >= b = lst
          | x `mod` a == 0 =
          let another = x `div` a in
            if another == a then findFactors (a+1) another ([a] ++ lst)
            else findFactors (a+1) another ([a, another] ++ lst)
          | otherwise = findFactors (a+1) b lst

-- Deal with multiplication of accumulated large numbers
-- Note that both the strNum and the resulting string are backward
-- It has been used in Q016 and Q020
largeMultiply strNum base = helper strNum 0 ""
  where
    helper a carry acc = case a of
        -- since the entire result is backward, we have to reverse the carry if
        -- it has more than one digit
        [] -> if carry == 0 then acc else acc ++ reverse (show carry)
        -- this is a trick to convert a char to a string
        (x : xs) ->
            let num = read (x : []) * base + carry
            in helper xs (num `div` 10) (acc ++ show (num `mod` 10))

-- Derive teh factorial of numbers that are larger than 2. So, we use the
-- largeMultiply function above.
factorial x = helper "1" [2..x]
  where helper strNum lst = case lst of
          [] -> reverse strNum
          (x:xs) -> helper (largeMultiply strNum x) xs
