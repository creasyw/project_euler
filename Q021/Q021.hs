{-# LANGUAGE FlexibleContexts #-}
import Data.List as List
import Data.Set as Set

factor n = List.sort $ concatMap
    (\x -> if x ^ 2 /= n then [x, n `div` x] else [x])
    [ x | x <- [1 .. round $ sqrt $ fromIntegral n], n `mod` x == 0 ]

isAmicable x = (x == factorSum y) && (x /= y)
  where y = factorSum x
        -- init is to remove the number itself from the list of factors
        factorSum n = sum . init $ factor n

sumAmicable limit = sum $ List.filter isAmicable [2..limit]

amicableNum x =
  if (x == factorSum y) && (x /= y)
  then y
  else 0
  where y = factorSum x
        factorSum n = sum . init $ factor n

sumAmicable1 limit = List.foldl (\acc x -> acc + x) 0 $ List.foldl (\acc x -> helper acc x) Set.empty [2..limit]
  where helper acc x =
          if member x acc
          then acc
          else if y == 0
               then acc
               else Set.insert x $ Set.insert y acc
          where y = amicableNum x
