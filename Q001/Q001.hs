m35 :: (Integral a) => a -> a
m35 x =
    sum
        . takeWhile (< x)
        . filter (\i -> i `mod` 3 == 0 || i `mod` 5 == 0)
        $ [1 ..]
