-- By considering the terms in the Fibonacci sequence whose values do not exceed
-- four million, find the sum of the even-valued terms.

-- this Fibonacci is ok, but for all x, it requires to calculate all the way
-- down to 1, but for this question, we just need to "grow" the list of numbers
fib :: (Integral a) => a -> a
fib 1 = 1
fib 2 = 2
fib x = fib (x-1) + fib (x - 2)

-- this is cool - generating an infinite list
fibs' :: (Num a) => [a]
fibs' = 0 : 1 : zipWith (+) fibs' (tail fibs')

evenSumFib :: (Integral a) => a -> a
evenSumFib limit = sum . filter even . takeWhile (< limit) $ fibs'
