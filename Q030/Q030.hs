sumDigits :: Int -> Int -> Int
sumDigits num power = sum([ (read [x] :: Int)^power | x <- show num])

sumNumbers :: Int -> Int -> Int
sumNumbers limit power = sum([x | x <- [2..limit], x == sumDigits x power])
