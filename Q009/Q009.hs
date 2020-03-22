productPythagorean :: (RealFrac a, Integral b, Enum a) => a -> b
productPythagorean s = floor $ a * b * c
  where
    (a, b) = head $ filter (\(x, y) -> x + y - ((x*y) / s) == s / 2) [(a, b) | a <- [1..s], b<-[1..s]]
    c = s - a - b
